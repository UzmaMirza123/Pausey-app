package com.pausey.pausey

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/** Restarts enforcement after reboot/update and re-evaluates after time or timezone changes. */
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        EnforcementService.sync(context)
    }
}
