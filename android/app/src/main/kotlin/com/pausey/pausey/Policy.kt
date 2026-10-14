package com.pausey.pausey

import android.content.Context
import org.json.JSONArray
import org.json.JSONObject
import java.util.Calendar

/** Saved copy of the policy Flutter sends (RestrictionRepo.policyJson). Readable while Flutter is closed. */
object PolicyStore {
    private const val PREFS = "pausey_native"
    private const val KEY = "policy"
    private const val KEY_VERSION = "policyVersion"

    /** Saves the policy and bumps [version] so cached copies (Enforcer) reload. */
    fun save(ctx: Context, json: String) {
        val prefs = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        prefs.edit().putString(KEY, json).putLong(KEY_VERSION, prefs.getLong(KEY_VERSION, 0L) + 1).apply()
    }

    /** Changes on every [save]; in-process reads see it immediately (SharedPreferences memory cache). */
    fun version(ctx: Context): Long = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getLong(KEY_VERSION, 0L)

    fun load(ctx: Context): Policy? {
        val raw = ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(KEY, null) ?: return null
        return try { Policy.parse(JSONObject(raw)) } catch (e: Exception) { null }
    }
}

/** Half-open [start, end) in local minutes; end <= start crosses midnight; days = start day (1 = Mon … 7 = Sun). */
data class Window(val id: String, val enabled: Boolean, val start: Int, val end: Int, val days: Set<Int>) {
    private val valid get() = start != end && start in 0..1439 && end in 0..1439 && days.isNotEmpty()

    fun activeAt(c: Calendar): Boolean {
        if (!enabled || !valid) return false
        val m = c.get(Calendar.HOUR_OF_DAY) * 60 + c.get(Calendar.MINUTE)
        val wd = isoWeekday(c)
        if (end > start) return wd in days && m >= start && m < end
        val yesterday = if (wd == 1) 7 else wd - 1
        return (wd in days && m >= start) || (yesterday in days && m < end)
    }

    companion object {
        fun parse(j: JSONObject, startKey: String = "start", endKey: String = "end") = Window(
            id = j.optString("id", "global"),
            enabled = j.optBoolean("enabled", true),
            start = j.optInt(startKey),
            end = j.optInt(endKey),
            days = j.optJSONArray("days").ints(),
        )
    }
}

data class AppPolicy(
    val pkg: String,
    val name: String,
    val locked: Boolean,
    val scheduled: Boolean,
    val enabled: Boolean,
    val limitOn: Boolean,
    val limitMin: Int,
    val schedOn: Boolean,
    val windows: List<Window>,
) {
    val hasOwnRules get() = enabled && ((limitOn && limitMin > 0) || (schedOn && windows.any { it.enabled }))
}

data class Unlock(val pkg: String, val expiryMs: Long, val reasons: Set<String>)

data class Policy(
    val apps: Map<String, AppPolicy>,
    val global: Window,
    val focusUntilMs: Long,
    val unlocks: Map<String, Unlock>,
    val strings: Map<String, String>,
) {
    fun str(key: String, fallback: String) = strings[key]?.takeIf { it.isNotBlank() } ?: fallback

    companion object {
        fun parse(j: JSONObject): Policy {
            val apps = mutableMapOf<String, AppPolicy>()
            val arr = j.optJSONArray("apps") ?: JSONArray()
            for (i in 0 until arr.length()) {
                val a = arr.getJSONObject(i)
                val cfg = a.optJSONObject("config")
                val ws = mutableListOf<Window>()
                cfg?.optJSONArray("schedules")?.let { s -> for (k in 0 until s.length()) ws += Window.parse(s.getJSONObject(k)) }
                val pkg = a.getString("pkg")
                apps[pkg] = AppPolicy(
                    pkg = pkg,
                    name = a.optString("name", pkg),
                    locked = a.optBoolean("locked"),
                    scheduled = a.optBoolean("scheduled"),
                    enabled = cfg?.optBoolean("enabled", true) ?: false,
                    limitOn = cfg?.optBoolean("limitOn") ?: false,
                    limitMin = cfg?.optInt("limitMin", 0) ?: 0,
                    schedOn = cfg?.optBoolean("schedOn", true) ?: false,
                    windows = ws,
                )
            }
            val unlocks = mutableMapOf<String, Unlock>()
            val ua = j.optJSONArray("unlocks") ?: JSONArray()
            for (i in 0 until ua.length()) {
                val u = ua.getJSONObject(i)
                val r = mutableSetOf<String>()
                u.optJSONArray("reasons")?.let { for (k in 0 until it.length()) r += it.getString(k) }
                unlocks[u.getString("pkg")] = Unlock(u.getString("pkg"), u.optLong("expiryMs"), r)
            }
            val strings = mutableMapOf<String, String>()
            j.optJSONObject("strings")?.let { s -> s.keys().forEach { strings[it] = s.optString(it) } }
            return Policy(
                apps = apps,
                global = Window.parse(j.optJSONObject("globalSchedule") ?: JSONObject()),
                focusUntilMs = j.optLong("focusUntilMs", 0),
                unlocks = unlocks,
                strings = strings,
            )
        }
    }
}

/** Same rules as lib/data/restrictions/restriction_evaluator.dart + RestrictionRepo.stateFor. */
object RestrictionEngine {
    const val LIMIT = "dailyLimit"
    const val SCHEDULE = "schedule"
    const val GLOBAL = "global"
    const val FOCUS = "focus"

    /** Reasons that restrict [app] right now. [usedMin] null = usage unknown (never triggers the limit). */
    fun reasons(p: Policy, app: AppPolicy, nowMs: Long, usedMin: Int?): Set<String> {
        if (!app.locked) return emptySet()
        val c = Calendar.getInstance().apply { timeInMillis = nowMs }
        val r = mutableSetOf<String>()
        if (app.enabled) {
            if (app.limitOn && app.limitMin > 0 && usedMin != null && usedMin >= app.limitMin) r += LIMIT
            if (app.schedOn && app.windows.any { it.activeAt(c) }) r += SCHEDULE
        }
        val global = if (app.scheduled) p.global.activeAt(c) else !app.hasOwnRules
        if (global) r += GLOBAL
        if (p.focusUntilMs > nowMs) r += FOCUS
        val u = p.unlocks[app.pkg]
        if (u != null && nowMs < u.expiryMs) r.removeAll { it != FOCUS && it in u.reasons }
        return r
    }
}

fun isoWeekday(c: Calendar): Int = when (c.get(Calendar.DAY_OF_WEEK)) {
    Calendar.MONDAY -> 1; Calendar.TUESDAY -> 2; Calendar.WEDNESDAY -> 3; Calendar.THURSDAY -> 4
    Calendar.FRIDAY -> 5; Calendar.SATURDAY -> 6; else -> 7
}

private fun JSONArray?.ints(): Set<Int> {
    if (this == null) return setOf(1, 2, 3, 4, 5, 6, 7)
    return (0 until length()).map { getInt(it) }.toSet()
}
