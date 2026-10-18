package com.pausey.pausey

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

// FlutterFragmentActivity is required by local_auth (Face ID / fingerprint prompt).
class MainActivity : FlutterFragmentActivity() {
    private var channel: NativeChannel? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = NativeChannel(this).also { it.register(flutterEngine.dartExecutor.binaryMessenger) }
    }

    override fun onResume() {
        super.onResume()
        // Back in Pausey (by itself or by the user): stop waiting for a permission in Settings.
        channel?.onActivityResumed()
    }
}
