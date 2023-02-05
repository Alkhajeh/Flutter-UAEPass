package com.example.uaepass_example

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channel = "poc.uaepass/channel1"
    private var methodChannel: MethodChannel? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor, channel)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        methodChannel?.invokeMethod("didRecieveTranscript", "")
    }
}
