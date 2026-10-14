package com.pausey.pausey

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.app.usage.UsageEvents
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.os.PowerManager
import android.provider.Settings

/**
 * Foreground service that enforces per-app limits and schedules while Pausey is closed.
 *
 * Every second it finds the app on screen (UsageEvents, incremental) and evaluates the saved
 * policy with RestrictionEngine. If the app is restricted it opens BlockActivity on top.
 * Android does not let a normal app truly freeze another app; this is the policy-compliant
 * equivalent used by digital-wellbeing apps and can lag by about a second.
 */
class EnforcementService : Service() {
    private val handler = Handler(Looper.getMainLooper())
    private var policy: Policy? = null
    private var lastEventMs = 0L
    private var foreground: String? = null
    private var usage: Map<String, Long> = emptyMap()
    private var usageAtMs = 0L
    private var lastBlockMs = 0L
    private var lastBlockedPkg: String? = null

    private val tick = object : Runnable {
        override fun run() {
            try { check() } catch (e: Exception) { /* keep running */ }
            handler.postDelayed(this, 1000)
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        startAsForeground()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        policy = PolicyStore.load(this)
        usageAtMs = 0 // re-read usage (time/zone may have changed)
        handler.removeCallbacks(tick)
        handler.post(tick)
        return START_STICKY
    }

    override fun onDestroy() {
        handler.removeCallbacks(tick)
        super.onDestroy()
    }

    private fun startAsForeground() {
        val nm = getSystemService(NotificationManager::class.java)
        if (Build.VERSION.SDK_INT >= 26) {
            nm.createNotificationChannel(NotificationChannel(CHANNEL, "App limits", NotificationManager.IMPORTANCE_MIN).apply { setShowBadge(false) })
        }
        val p = PolicyStore.load(this)
        val open = PendingIntent.getActivity(
            this, 0, packageManager.getLaunchIntentForPackage(packageName), PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_UPDATE_CURRENT,
        )
        @Suppress("DEPRECATION")
        val b = if (Build.VERSION.SDK_INT >= 26) Notification.Builder(this, CHANNEL) else Notification.Builder(this)
        val n = b.setSmallIcon(R.drawable.ic_stat_pausey)
            .setContentTitle(p?.str("notifTitle", "Pausey is keeping your limits") ?: "Pausey is keeping your limits")
            .setContentText(p?.str("notifText", "App limits and lock schedules are on") ?: "App limits and lock schedules are on")
            .setOngoing(true)
            .setContentIntent(open)
            .build()
        if (Build.VERSION.SDK_INT >= 34) {
            startForeground(NOTIF_ID, n, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(NOTIF_ID, n)
        }
    }

    private fun check() {
        val p = policy ?: return stopSelf()
        if (!UsageReader.hasAccess(this) || !Settings.canDrawOverlays(this)) return // honest: nothing to enforce with
        val pm = getSystemService(Context.POWER_SERVICE) as PowerManager
        if (!pm.isInteractive) return
        val now = System.currentTimeMillis()
        updateForeground(now)
        val fg = foreground ?: return
        if (fg == packageName) return
        val app = p.apps[fg] ?: return
        // Usage: refresh every 30 s, or right away when the day changed.
        if (now - usageAtMs > 30_000 || UsageReader.startOfToday(now) != UsageReader.startOfToday(usageAtMs)) {
            usage = UsageReader.usageToday(this, p.apps.keys, now)
            usageAtMs = now
        }
        val usedMin = ((usage[fg] ?: 0L) / 60_000L).toInt()
        val reasons = RestrictionEngine.reasons(p, app, now, usedMin)
        if (reasons.isEmpty()) return
        if (fg == lastBlockedPkg && now - lastBlockMs < 1500) return
        lastBlockedPkg = fg
        lastBlockMs = now
        startActivity(BlockActivity.intent(this, app.name, reasons, p))
    }

    /** Reads only events since the last tick; the first call looks back 6 hours. */
    private fun updateForeground(now: Long) {
        val usm = getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val from = if (lastEventMs == 0L || now < lastEventMs) now - 6 * 3600_000L else lastEventMs
        val events = usm.queryEvents(from, now)
        val e = UsageEvents.Event()
        while (events.hasNextEvent()) {
            events.getNextEvent(e)
            when (e.eventType) {
                UsageEvents.Event.ACTIVITY_RESUMED -> foreground = e.packageName
                UsageEvents.Event.ACTIVITY_PAUSED, UsageEvents.Event.ACTIVITY_STOPPED -> if (e.packageName == foreground) foreground = null
            }
            if (e.timeStamp > lastEventMs) lastEventMs = e.timeStamp
        }
        if (lastEventMs == 0L || now < lastEventMs) lastEventMs = now // clock moved backwards
    }

    companion object {
        private const val CHANNEL = "pausey_enforcement"
        private const val NOTIF_ID = 4107

        /** Start or stop depending on whether anything needs enforcing and permissions exist. */
        fun sync(ctx: Context) {
            val p = PolicyStore.load(ctx)
            val needed = p != null && p.apps.values.any { it.locked } &&
                UsageReader.hasAccess(ctx) && Settings.canDrawOverlays(ctx)
            val i = Intent(ctx, EnforcementService::class.java)
            if (!needed) {
                ctx.stopService(i)
                return
            }
            try {
                if (Build.VERSION.SDK_INT >= 26) ctx.startForegroundService(i) else ctx.startService(i)
            } catch (e: Exception) {
                // Background start not allowed right now (e.g. Android 12+ restrictions); retried on next app open/boot.
            }
        }

        fun isRunning(ctx: Context): Boolean {
            @Suppress("DEPRECATION")
            val am = ctx.getSystemService(Context.ACTIVITY_SERVICE) as android.app.ActivityManager
            @Suppress("DEPRECATION")
            return am.getRunningServices(50).any { it.service.className == EnforcementService::class.java.name }
        }
    }
}
