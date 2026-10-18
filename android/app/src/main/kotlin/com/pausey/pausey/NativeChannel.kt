package com.pausey.pausey

import android.Manifest
import android.app.NotificationManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.os.SystemClock
import android.provider.Settings
import androidx.activity.ComponentActivity
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.concurrent.Executors

/**
 * `pausey/native` channel used by lib/services/native_bridge.dart.
 *
 * [activity] is only used for the runtime notification-permission dialog; everything else uses the
 * application context so nothing holds on to the activity.
 */
class NativeChannel(private val activity: ComponentActivity) {
    private val ctx: Context = activity.applicationContext
    private val io = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())

    private var notifLauncher: ActivityResultLauncher<String>? = null
    private var notifPending: MethodChannel.Result? = null
    private var notifAskedAtMs = 0L

    fun register(messenger: BinaryMessenger) {
        MethodChannel(messenger, "pausey/native").setMethodCallHandler { call, result ->
            when (call.method) {
                "status" -> result.success(status())
                "openUsageAccess" -> {
                    open(Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS))
                    returnWhenGranted { UsageReader.hasAccess(ctx) }
                    result.success(null)
                }
                "openOverlay" -> {
                    open(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:${ctx.packageName}")))
                    returnWhenGranted { Settings.canDrawOverlays(ctx) }
                    result.success(null)
                }
                "openNotifications" -> { open(notificationSettings()); result.success(null) }
                "requestNotifications" -> requestNotifications(result)
                "openAccessibility" -> {
                    val cn = ComponentName(ctx, PauseyAccessibilityService::class.java).flattenToString()
                    // The fragment-args extras make many Settings apps scroll to / highlight Pausey's row.
                    val args = android.os.Bundle().apply { putString(":settings:fragment_args_key", cn) }
                    open(
                        Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
                            .putExtra(":settings:fragment_args_key", cn)
                            .putExtra(":settings:show_fragment_args", args),
                    )
                    returnWhenGranted { PauseyAccessibilityService.isEnabled(ctx) }
                    result.success(null)
                }
                "openBattery" -> {
                    open(Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:${ctx.packageName}")))
                    result.success(null)
                }
                "installedApps" -> background(result) { installedApps() }
                "usageToday" -> background(result) {
                    if (!UsageReader.hasAccess(ctx)) mapOf("granted" to false)
                    else {
                        val pkgs = (call.argument<List<String>>("packages") ?: emptyList()).toSet()
                        mapOf("granted" to true, "usage" to UsageReader.usageToday(ctx, pkgs.ifEmpty { null }))
                    }
                }
                "syncPolicy" -> {
                    PolicyStore.save(ctx, call.argument<String>("json") ?: "{}")
                    EnforcementService.sync(ctx)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun status(): Map<String, Any> {
        val pm = ctx.getSystemService(Context.POWER_SERVICE) as PowerManager
        val nm = ctx.getSystemService(NotificationManager::class.java)
        return mapOf(
            "usageAccess" to UsageReader.hasAccess(ctx),
            "overlay" to Settings.canDrawOverlays(ctx),
            "notifications" to nm.areNotificationsEnabled(),
            "accessibility" to PauseyAccessibilityService.isEnabled(ctx),
            "batteryUnrestricted" to pm.isIgnoringBatteryOptimizations(ctx.packageName),
            "serviceRunning" to EnforcementService.isRunning(ctx),
            "manufacturer" to Build.MANUFACTURER,
        )
    }

    private fun notificationSettings(): Intent = if (Build.VERSION.SDK_INT >= 26) {
        Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).putExtra(Settings.EXTRA_APP_PACKAGE, ctx.packageName)
    } else {
        Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:${ctx.packageName}"))
    }

    /**
     * Android 13+: shows the system "Allow notifications?" dialog and replies once the user answered.
     * If Android refuses to show it (denied before / "don't ask again"), the request comes back denied
     * almost instantly without a dialog — then we open Pausey's notification settings instead.
     * Below 13 there is no runtime permission: opens settings only if notifications are off.
     */
    private fun requestNotifications(result: MethodChannel.Result) {
        val nm = ctx.getSystemService(NotificationManager::class.java)
        if (Build.VERSION.SDK_INT < 33) {
            if (!nm.areNotificationsEnabled()) open(notificationSettings())
            result.success(null)
            return
        }
        if (ctx.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS) == PackageManager.PERMISSION_GRANTED) {
            if (!nm.areNotificationsEnabled()) open(notificationSettings()) // granted but switched off in settings
            result.success(null)
            return
        }
        val prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        val askedBefore = prefs.getBoolean(KEY_NOTIF_ASKED, false)
        if (askedBefore && !activity.shouldShowRequestPermissionRationale(Manifest.permission.POST_NOTIFICATIONS) &&
            prefs.getBoolean(KEY_NOTIF_BLOCKED, false)
        ) {
            // Android already stopped showing the dialog last time; don't make the user tap twice.
            open(notificationSettings())
            result.success(null)
            return
        }
        val launcher = notifLauncher ?: try {
            activity.activityResultRegistry.register("pausey_notifications", ActivityResultContracts.RequestPermission()) { granted ->
                onNotificationResult(granted)
            }.also { notifLauncher = it }
        } catch (e: Exception) {
            null
        }
        if (launcher == null) {
            open(notificationSettings())
            result.success(null)
            return
        }
        notifPending?.success(null) // a previous request still waiting: answer it, the new one wins
        notifPending = result
        notifAskedAtMs = SystemClock.elapsedRealtime()
        prefs.edit().putBoolean(KEY_NOTIF_ASKED, true).apply()
        try {
            launcher.launch(Manifest.permission.POST_NOTIFICATIONS)
        } catch (e: Exception) {
            notifPending = null
            open(notificationSettings())
            result.success(null)
        }
    }

    private fun onNotificationResult(granted: Boolean) {
        val prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        // No dialog was shown if the denial came back this fast (no human answers in < 700 ms).
        val instantDenial = !granted && SystemClock.elapsedRealtime() - notifAskedAtMs < 700 &&
            Build.VERSION.SDK_INT >= 33 &&
            !activity.shouldShowRequestPermissionRationale(Manifest.permission.POST_NOTIFICATIONS)
        prefs.edit().putBoolean(KEY_NOTIF_BLOCKED, instantDenial).apply()
        if (instantDenial) open(notificationSettings())
        notifPending?.success(null)
        notifPending = null
    }

    // --- Back to Pausey once a permission is switched on ----------------------------------------

    private var watch: Runnable? = null

    /**
     * After sending the user to a Settings screen, checks [granted] every 400 ms (for up to 2 minutes).
     * As soon as it's on, Pausey comes back to the front by itself. Stops early if the user comes
     * back on their own ([onActivityResumed]).
     */
    private fun returnWhenGranted(granted: () -> Boolean) {
        stopWatching()
        if (granted()) return
        val startedAt = SystemClock.elapsedRealtime()
        val r = object : Runnable {
            override fun run() {
                val on = try { granted() } catch (e: Exception) { false }
                when {
                    on -> { stopWatching(); bringBack() }
                    SystemClock.elapsedRealtime() - startedAt > 120_000 -> stopWatching()
                    else -> main.postDelayed(this, 400)
                }
            }
        }
        watch = r
        main.postDelayed(r, 600)
    }

    private fun stopWatching() {
        watch?.let { main.removeCallbacks(it) }
        watch = null
    }

    /** Called by [MainActivity.onResume]: the user is back in Pausey, nothing to wait for. */
    fun onActivityResumed() = stopWatching()

    private fun bringBack() {
        try {
            ctx.startActivity(
                Intent(ctx, MainActivity::class.java).addFlags(
                    Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_SINGLE_TOP,
                ),
            )
        } catch (e: Exception) {
            // Some phones don't let an app come forward on its own; the user simply goes back.
        }
    }

    private fun open(i: Intent) {
        try {
            ctx.startActivity(i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        } catch (e: Exception) {
            ctx.startActivity(Intent(Settings.ACTION_SETTINGS).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        }
    }

    private fun background(result: MethodChannel.Result, work: () -> Any?) {
        io.execute {
            try {
                val v = work()
                main.post { result.success(v) }
            } catch (e: Exception) {
                main.post { result.error("native", e.message, null) }
            }
        }
    }

    /** Launchable apps (needs the <queries> LAUNCHER entry in the manifest, not QUERY_ALL_PACKAGES). */
    private fun installedApps(): List<Map<String, Any?>> {
        val pm = ctx.packageManager
        val i = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
        @Suppress("DEPRECATION")
        val acts = pm.queryIntentActivities(i, 0)
        val seen = mutableSetOf<String>()
        val out = mutableListOf<Map<String, Any?>>()
        for (ri in acts) {
            val pkg = ri.activityInfo?.packageName ?: continue
            if (pkg == ctx.packageName || !seen.add(pkg)) continue
            // One broken app must not hide the rest.
            val label = try { ri.loadLabel(pm).toString() } catch (e: Exception) { pkg }
            val icon = try { iconPng(ri.loadIcon(pm)) } catch (e: Exception) { null }
            out += mapOf("pkg" to pkg, "label" to label, "icon" to icon)
        }
        return out
    }

    private fun iconPng(d: android.graphics.drawable.Drawable): ByteArray? = try {
        val size = 96
        val bmp = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
        val c = Canvas(bmp)
        d.setBounds(0, 0, size, size)
        d.draw(c)
        ByteArrayOutputStream().use { bmp.compress(Bitmap.CompressFormat.PNG, 100, it); it.toByteArray() }
    } catch (e: Exception) { null }

    private companion object {
        const val PREFS = "pausey_native"
        const val KEY_NOTIF_ASKED = "notifAsked"
        const val KEY_NOTIF_BLOCKED = "notifBlocked"
    }
}
