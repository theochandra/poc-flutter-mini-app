package com.diffexample.main_app_with_aar

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.diffexample.main_app_with_aar.databinding.ActivityMainBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding

    private var flutterEngine: FlutterEngine? = null

    private val SCREEN_ENGINE_ID = "screenEngineId"
    private val CHANNEL = "com.example.flutter_module/closeModule"
    private val INVOKED_METHOD = "exitFlutterModule"

    private fun setUpFlutter() {
        if (flutterEngine == null) {
            flutterEngine = FlutterEngineCache.getInstance().get(SCREEN_ENGINE_ID)
//            flutterEngine!!
//                .dartExecutor
//                .executeDartEntrypoint(
//                    DartExecutor.DartEntrypoint.createDefault()
//                )
        }

        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when(call.method) {
                    INVOKED_METHOD -> finish()
                    else -> result.notImplemented()
                }
            }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        val view = binding.root
        setContentView(view)
        setUpFlutter()

        binding.btnOpenFlutterModule.setOnClickListener {
            startActivity(
                FlutterActivity.createDefaultIntent(this)
            )
        }
    }
}