package com.diffexample.main_app_with_aar

import android.app.Application
import android.util.Log
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

const val FLUTTER_ENGINE_ID = "FLUTTER_ENGINE_ID"

class BaseApplication : Application() {
    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()

        Log.d("BASE_APP", "MASUK ON CREATE")

        // instantiate a FlutterEngine
        flutterEngine = FlutterEngine(this)

        // configure initial route
//        flutterEngine.navigationChannel.setInitialRoute("/")

        // start executing Dart code to pre-warm the FlutterEngine
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // cache the FlutterEngine to be used by FlutterActivity
        FlutterEngineCache
            .getInstance()
            .put(FLUTTER_ENGINE_ID, flutterEngine)
    }
}