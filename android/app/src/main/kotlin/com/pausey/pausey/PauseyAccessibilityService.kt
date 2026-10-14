package com.pausey.pausey

import android.accessibilityservice.AccessibilityService
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.os.SystemClock
import android.provider.Settings
import android.view.accessibility.AccessibilityEvent
import android.view.inputmethod.InputMethodManager

/**
 * Optional, user-enabled Accessibility Service: tells Pausey instantly which app came to the front so
 * limits and lock schedules apply without the ~1 s UsageEvents lag. It only reads the package (and window
 * class) name of window-state events — it never reads or inspects screen content (see
 * res/xml/pausey_accessibility.xml: canRetrieveWindowContent=false).
 */
class PauseyAccessibilityService : AccessibilityService() {
    private var ignored: Set<String> = emptySet()
    private var ignoredAtMs = 0L

    override fun onServiceConnected() {
        super.onServiceConnected()
        ignoredAtMs = 0L
        // Accessibility alone (no overlay permission) can now satisfy enforcement: start the service if needed.
        EnforcementService.sync(this)
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (event == null || event.eventType != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) return
        val pkg = event.packageName?.toString() ?: return
        if (isIgnored(pkg)) return
        // Read the two strings now: the event object is recycled once this method returns.
        Enforcer.onWindowChanged(applicationContext, pkg, event.className?.toString())
    }

    override fun onInterrupt() {}

    override fun onUnbind(intent: Intent?): Boolean {
        // Switched off: stop the foreground service if overlay permission isn't there to replace us.
        EnforcementService.sync(applicationContext)
        return super.onUnbind(intent)
    }

    private fun isIgnored(pkg: String): Boolean {
        if (pkg == packageName || pkg == "com.android.systemui" || pkg == "android") return true
        val now = SystemClock.elapsedRealtime()
        if (ignoredAtMs == 0L || now - ignoredAtMs > 60_000L) {
            ignored = homeAndKeyboardPackages()
            ignoredAtMs = now
        }
        return pkg in ignored
    }

    /** Default launcher and input methods: they appear on top constantly and are never restricted. */
    private fun homeAndKeyboardPackages(): Set<String> {
        val out = mutableSetOf<String>()
        try {
            val home = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME)
            val pm = packageManager
            if (Build.VERSION.SDK_INT >= 33) {
                pm.resolveActivity(home, PackageManager.ResolveInfoFlags.of(PackageManager.MATCH_DEFAULT_ONLY.toLong()))
                    ?.activityInfo?.packageName?.let { out += it }
            } else {
                @Suppress("DEPRECATION") // flags-int overload is the only one below API 33
                pm.resolveActivity(home, PackageManager.MATCH_DEFAULT_ONLY)?.activityInfo?.packageName?.let { out += it }
            }
            // With no default launcher chosen this resolves to the chooser ("android"), ignored above anyway.
        } catch (e: Exception) { /* keep what we have */ }
        try {
            val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            imm.enabledInputMethodList.mapTo(out) { it.packageName }
        } catch (e: Exception) { /* keep what we have */ }
        Settings.Secure.getString(contentResolver, Settings.Secure.DEFAULT_INPUT_METHOD)
            ?.let { ComponentName.unflattenFromString(it)?.packageName }
            ?.let { out += it }
        return out
    }

    companion object {
        /** True when the user switched Pausey on in Settings › Accessibility. */
        fun isEnabled(ctx: Context): Boolean {
            val enabled = Settings.Secure.getString(ctx.contentResolver, Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES)
            if (enabled.isNullOrEmpty()) return false
            val cn = ComponentName(ctx, PauseyAccessibilityService::class.java)
            val long = cn.flattenToString()
            val short = cn.flattenToShortString()
            return enabled.split(':').any { it.equals(long, ignoreCase = true) || it.equals(short, ignoreCase = true) }
        }
    }
}
