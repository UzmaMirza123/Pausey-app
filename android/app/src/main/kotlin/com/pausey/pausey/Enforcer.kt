package com.pausey.pausey

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.ComponentName
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import android.os.Handler
import android.os.HandlerThread
import android.provider.Settings

/**
 * Shared enforcement used by EnforcementService (1 s UsageEvents tick) and PauseyAccessibilityService
 * (instant window-change events).
 *
 * All state is confined to one background thread ([handler]); callers post work to it, so the two
 * sources can never race or double-launch the block screen (shared 1.5 s debounce).
 */
object Enforcer {
    private val thread = HandlerThread("pausey-enforcer").apply { start() }
    val handler = Handler(thread.looper)

    private const val DEBOUNCE_MS = 1500L
    private const val USAGE_TTL_MS = 30_000L
    private const val NUDGE_CHANNEL = "pausey_nudges"
    private const val NUDGE_PREFS = "pausey_nudges"
    private const val NUDGE_NOTIF_BASE = 5000

    private var policy: Policy? = null
    private var policyVersion = Long.MIN_VALUE
    private var usage: Map<String, Long> = emptyMap()
    private var usageAtMs = 0L
    private var lastBlockMs = 0L
    private var lastBlockedPkg: String? = null
    private val activityClassCache = HashMap<String, Boolean>()

    /** What showing the block screen needs (same rule as EnforcementService.sync and NativeStatus.canEnforce). */
    fun canEnforce(ctx: Context): Boolean =
        UsageReader.hasAccess(ctx) && (Settings.canDrawOverlays(ctx) || PauseyAccessibilityService.isEnabled(ctx))

    /** Forget cached usage (time or time zone changed). Thread-safe. */
    fun invalidateUsage() {
        handler.post { usageAtMs = 0L }
    }

    /** Accessibility path: a window of [pkg] came to the front. Only activity windows count (see [isActivity]). */
    fun onWindowChanged(ctx: Context, pkg: String, cls: String?) {
        handler.post {
            try {
                val p = currentPolicy(ctx) ?: return@post
                if (pkg !in p.apps) return@post
                if (!isActivity(ctx, pkg, cls)) return@post
                check(ctx, pkg, System.currentTimeMillis())
            } catch (e: Exception) {
                // Never let one bad event kill the enforcer thread.
            }
        }
    }

    /** Evaluate [pkg] (the app on screen) and block or nudge. Must run on [handler]'s thread. */
    fun check(ctx: Context, pkg: String, now: Long) {
        if (pkg == ctx.packageName) return
        val p = currentPolicy(ctx) ?: return
        val app = p.apps[pkg] ?: return
        if (!UsageReader.hasAccess(ctx)) return // honest: no usage numbers, nothing to enforce with
        if (now - usageAtMs > USAGE_TTL_MS || now < usageAtMs ||
            UsageReader.startOfToday(now) != UsageReader.startOfToday(usageAtMs)
        ) {
            usage = UsageReader.usageToday(ctx, p.apps.keys, now)
            usageAtMs = now
        }
        val usedMin = ((usage[pkg] ?: 0L) / 60_000L).toInt()
        val reasons = RestrictionEngine.reasons(p, app, now, usedMin)
        if (reasons.isEmpty()) {
            maybeNudge(ctx, p, app, usedMin, now)
            return
        }
        if (!canEnforce(ctx)) return
        if (pkg == lastBlockedPkg && now - lastBlockMs in 0 until DEBOUNCE_MS) return
        lastBlockedPkg = pkg
        lastBlockMs = now
        ctx.startActivity(BlockActivity.intent(ctx, app.name, reasons, p))
    }

    /** Cached policy, reloaded whenever PolicyStore.save bumped the version. */
    fun currentPolicy(ctx: Context): Policy? {
        val v = PolicyStore.version(ctx)
        if (v != policyVersion) {
            policy = PolicyStore.load(ctx)
            policyVersion = v
            usageAtMs = 0L // the tracked app set may have changed
        }
        return policy
    }

    /**
     * True when [cls] is a real activity of [pkg]. Window-state events also fire for dialogs, popups and
     * other apps' floating overlays (chat heads); those must not count as "the user opened this app".
     * Uses only the window's class name from the event, never screen content. Unknown → false, and the
     * 1 s service tick (activity-resume based) still catches the app.
     */
    private fun isActivity(ctx: Context, pkg: String, cls: String?): Boolean {
        if (cls.isNullOrEmpty()) return false
        val key = "$pkg/$cls"
        activityClassCache[key]?.let { return it }
        val pm = ctx.packageManager
        val cn = ComponentName(pkg, cls)
        val isAct = try {
            if (Build.VERSION.SDK_INT >= 33) {
                pm.getActivityInfo(cn, PackageManager.ComponentInfoFlags.of(0))
            } else {
                @Suppress("DEPRECATION") // flags-int overload is the only one below API 33
                pm.getActivityInfo(cn, 0)
            }
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
        if (activityClassCache.size > 256) activityClassCache.clear()
        activityClassCache[key] = isAct
        return isAct
    }

    // ---------------------------------------------------------------------------------------------
    // Limit nudges: one honest heads-up per app per local day, 5 minutes before its daily limit.
    // ---------------------------------------------------------------------------------------------

    private fun maybeNudge(ctx: Context, p: Policy, app: AppPolicy, usedMin: Int, now: Long) {
        if (!app.locked || !app.enabled || !app.limitOn || app.limitMin < 10) return
        if (usedMin < app.limitMin - 5 || usedMin >= app.limitMin) return
        val nm = ctx.getSystemService(NotificationManager::class.java) ?: return
        if (!nm.areNotificationsEnabled()) return
        val prefs = ctx.getSharedPreferences(NUDGE_PREFS, Context.MODE_PRIVATE)
        val day = UsageReader.startOfToday(now)
        val sent = if (prefs.getLong("day", -1L) == day) prefs.getStringSet("pkgs", emptySet()).orEmpty() else emptySet()
        if (app.pkg in sent) return

        if (Build.VERSION.SDK_INT >= 26) {
            if (nm.getNotificationChannel(NUDGE_CHANNEL) == null) {
                nm.createNotificationChannel(
                    NotificationChannel(NUDGE_CHANNEL, p.str("nudgeChannel", "Limit reminders"), NotificationManager.IMPORTANCE_DEFAULT),
                )
            }
            if (nm.getNotificationChannel(NUDGE_CHANNEL)?.importance == NotificationManager.IMPORTANCE_NONE) return
        }
        val open = ctx.packageManager.getLaunchIntentForPackage(ctx.packageName)?.let {
            PendingIntent.getActivity(ctx, 1, it, PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT)
        }
        @Suppress("DEPRECATION") // channel-less builder is the only one below API 26
        val b = if (Build.VERSION.SDK_INT >= 26) Notification.Builder(ctx, NUDGE_CHANNEL) else Notification.Builder(ctx)
        val n = b.setSmallIcon(R.drawable.ic_stat_pausey)
            .setContentTitle(p.str("nudgeTitle", "Almost at your {app} limit").replace("{app}", app.name))
            .setContentText(
                p.str("nudgeText", "{used} of {limit} used today")
                    .replace("{used}", minutes(p, usedMin))
                    .replace("{limit}", minutes(p, app.limitMin)),
            )
            .setCategory(Notification.CATEGORY_REMINDER)
            .setAutoCancel(true)
            .setOnlyAlertOnce(true)
            .apply { if (open != null) setContentIntent(open) }
            .build()
        try {
            nm.notify(NUDGE_NOTIF_BASE + (app.pkg.hashCode() and 0xFFFF), n)
        } catch (e: SecurityException) {
            return // POST_NOTIFICATIONS revoked between the check and the post
        }
        prefs.edit().putLong("day", day).putStringSet("pkgs", sent + app.pkg).apply()
    }

    /** "25 min", "1 h", "1 h 25 min" — unit words come from the policy strings when Flutter sent them. */
    private fun minutes(p: Policy, m: Int): String {
        val h = m / 60
        val r = m % 60
        return when {
            h == 0 -> p.str("durMin", "{m} min").replace("{m}", "$r")
            r == 0 -> p.str("durH", "{h} h").replace("{h}", "$h")
            else -> p.str("durHM", "{h} h {m} min").replace("{h}", "$h").replace("{m}", "$r")
        }
    }
}
