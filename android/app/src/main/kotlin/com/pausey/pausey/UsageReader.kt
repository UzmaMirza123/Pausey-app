package com.pausey.pausey

import android.app.AppOpsManager
import android.app.usage.UsageEvents
import android.app.usage.UsageStatsManager
import android.content.Context
import android.os.Build
import android.os.Process
import java.util.Calendar

/**
 * Real foreground time per app, built from UsageEvents (not the coarse daily buckets):
 * resumed → paused/stopped pairs since local midnight, merged across launches.
 * Overlapping or duplicate events can't make a total negative or double count.
 */
object UsageReader {
    fun hasAccess(ctx: Context): Boolean {
        val ops = ctx.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = if (Build.VERSION.SDK_INT >= 29) {
            @Suppress("DEPRECATION")
            ops.unsafeCheckOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, Process.myUid(), ctx.packageName)
        } else {
            @Suppress("DEPRECATION")
            ops.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, Process.myUid(), ctx.packageName)
        }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    fun startOfToday(nowMs: Long): Long = Calendar.getInstance().apply {
        timeInMillis = nowMs
        set(Calendar.HOUR_OF_DAY, 0); set(Calendar.MINUTE, 0); set(Calendar.SECOND, 0); set(Calendar.MILLISECOND, 0)
    }.timeInMillis

    private fun isStart(t: Int) = t == UsageEvents.Event.ACTIVITY_RESUMED
    private fun isEnd(t: Int) = t == UsageEvents.Event.ACTIVITY_PAUSED || t == UsageEvents.Event.ACTIVITY_STOPPED ||
        (Build.VERSION.SDK_INT >= 29 && t == UsageEvents.Event.DEVICE_SHUTDOWN)

    /** Foreground milliseconds since local midnight, per package (only [packages] when given). */
    fun usageToday(ctx: Context, packages: Set<String>?, nowMs: Long = System.currentTimeMillis()): Map<String, Long> {
        val usm = ctx.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val from = startOfToday(nowMs)
        val events = usm.queryEvents(from, nowMs)
        val open = mutableMapOf<String, Long>() // pkg -> resumed at
        val firstSeenEnd = mutableSetOf<String>()
        val total = mutableMapOf<String, Long>()
        val e = UsageEvents.Event()
        while (events.hasNextEvent()) {
            events.getNextEvent(e)
            val pkg = e.packageName ?: continue
            if (packages != null && pkg !in packages) continue
            val t = e.timeStamp.coerceIn(from, nowMs)
            when {
                isStart(e.eventType) -> if (pkg !in open) open[pkg] = t
                isEnd(e.eventType) -> {
                    val s = open.remove(pkg)
                    if (s != null) total[pkg] = (total[pkg] ?: 0L) + (t - s).coerceAtLeast(0)
                    else if (pkg !in firstSeenEnd && pkg !in total) {
                        // Already in the foreground at midnight.
                        firstSeenEnd += pkg
                        total[pkg] = (total[pkg] ?: 0L) + (t - from).coerceAtLeast(0)
                    }
                }
            }
        }
        for ((pkg, s) in open) total[pkg] = (total[pkg] ?: 0L) + (nowMs - s).coerceAtLeast(0)
        return total
    }

    /** Package currently on screen (last resumed activity without a later pause), or null. */
    fun foregroundPackage(ctx: Context, nowMs: Long = System.currentTimeMillis()): String? {
        val usm = ctx.getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val events = usm.queryEvents(nowMs - 6 * 60 * 60 * 1000L, nowMs)
        var fg: String? = null
        val e = UsageEvents.Event()
        while (events.hasNextEvent()) {
            events.getNextEvent(e)
            if (isStart(e.eventType)) fg = e.packageName
            else if (isEnd(e.eventType) && e.packageName == fg) fg = null
        }
        return fg
    }
}
