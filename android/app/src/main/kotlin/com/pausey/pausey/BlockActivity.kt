package com.pausey.pausey

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Bundle
import android.util.TypedValue
import android.view.Gravity
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

/** Calm full-screen "app paused" screen shown over a restricted app. Leaving it goes to the home screen. */
class BlockActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        render()
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        render()
    }

    private fun dp(v: Int) = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v.toFloat(), resources.displayMetrics).toInt()

    private fun render() {
        val title = intent.getStringExtra(EXTRA_TITLE) ?: "App paused"
        val body = intent.getStringExtra(EXTRA_BODY) ?: ""
        val close = intent.getStringExtra(EXTRA_CLOSE) ?: "Close app"
        val root = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            setPadding(dp(28), dp(28), dp(28), dp(28))
            setBackgroundColor(Color.parseColor("#0D0B22"))
        }
        val badge = TextView(this).apply {
            text = "❚❚"
            setTextColor(Color.WHITE)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 26f)
            gravity = Gravity.CENTER
            background = GradientDrawable().apply { shape = GradientDrawable.OVAL; setColor(Color.parseColor("#7B5CFF")) }
            layoutParams = LinearLayout.LayoutParams(dp(84), dp(84)).apply { bottomMargin = dp(28) }
        }
        val t = TextView(this).apply {
            text = title
            setTextColor(Color.WHITE)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 24f)
            typeface = Typeface.DEFAULT_BOLD
            gravity = Gravity.CENTER
        }
        val b = TextView(this).apply {
            text = body
            setTextColor(Color.parseColor("#B8B2DA"))
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f)
            gravity = Gravity.CENTER
            setPadding(0, dp(12), 0, dp(36))
        }
        val btn = Button(this).apply {
            text = close
            isAllCaps = false
            setTextColor(Color.WHITE)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f)
            background = GradientDrawable().apply { cornerRadius = dp(28).toFloat(); setColor(Color.parseColor("#7B5CFF")) }
            minHeight = dp(52)
            setPadding(dp(32), 0, dp(32), 0)
            setOnClickListener { goHome() }
        }
        root.addView(badge); root.addView(t); root.addView(b); root.addView(btn)
        setContentView(root)
    }

    @Deprecated("Back always leaves the restricted app")
    override fun onBackPressed() = goHome()

    private fun goHome() {
        startActivity(Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
        finish()
    }

    companion object {
        private const val EXTRA_TITLE = "title"
        private const val EXTRA_BODY = "body"
        private const val EXTRA_CLOSE = "close"

        fun intent(ctx: Context, appName: String, reasons: Set<String>, p: Policy): Intent {
            val lines = reasons.sortedBy { listOf(RestrictionEngine.FOCUS, RestrictionEngine.SCHEDULE, RestrictionEngine.LIMIT, RestrictionEngine.GLOBAL).indexOf(it) }.map {
                when (it) {
                    RestrictionEngine.LIMIT -> p.str("reasonLimit", "You've used today's time for this app.")
                    RestrictionEngine.SCHEDULE -> p.str("reasonSchedule", "A lock schedule is active right now.")
                    RestrictionEngine.FOCUS -> p.str("reasonFocus", "You're in a focus session.")
                    else -> p.str("reasonGlobal", "This app is locked in Pausey.")
                }
            }
            return Intent(ctx, BlockActivity::class.java)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP or Intent.FLAG_ACTIVITY_NO_ANIMATION)
                .putExtra(EXTRA_TITLE, p.str("blockTitle", "{app} is paused").replace("{app}", appName))
                .putExtra(EXTRA_BODY, lines.joinToString("\n"))
                .putExtra(EXTRA_CLOSE, p.str("close", "Close app"))
        }
    }
}
