package com.pausey.pausey

import android.app.NotificationManager
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.Canvas
import android.net.Uri
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.provider.Settings
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel
import java.io.ByteArrayOutputStream
import java.util.concurrent.Executors

/** `pausey/native` channel used by lib/services/native_bridge.dart. */
class NativeChannel(private val ctx: Context) {
    private val io = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())

    fun register(messenger: BinaryMessenger) {
        MethodChannel(messenger, "pausey/native").setMethodCallHandler { call, result ->
            when (call.method) {
                "status" -> result.success(status())
                "openUsageAccess" -> { open(Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)); result.success(null) }
                "openOverlay" -> {
                    open(Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:${ctx.packageName}")))
                    result.success(null)
                }
                "openNotifications" -> {
                    val i = if (Build.VERSION.SDK_INT >= 26) {
                        Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS).putExtra(Settings.EXTRA_APP_PACKAGE, ctx.packageName)
                    } else {
                        Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:${ctx.packageName}"))
                    }
                    open(i); result.success(null)
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
            "batteryUnrestricted" to pm.isIgnoringBatteryOptimizations(ctx.packageName),
            "serviceRunning" to EnforcementService.isRunning(ctx),
            "manufacturer" to Build.MANUFACTURER,
        )
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
            val pkg = ri.activityInfo.packageName
            if (pkg == ctx.packageName || !seen.add(pkg)) continue
            out += mapOf("pkg" to pkg, "label" to ri.loadLabel(pm).toString(), "icon" to iconPng(ri.loadIcon(pm)))
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
}
