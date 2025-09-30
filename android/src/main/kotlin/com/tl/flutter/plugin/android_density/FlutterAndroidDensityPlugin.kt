package com.tl.flutter.plugin.android_density

import android.content.Context
import android.util.TypedValue

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAndroidDensityPlugin */
class FlutterAndroidDensityPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var binding: FlutterPlugin.FlutterPluginBinding

  companion object {
    private const val channelName: String = "flutter_android_density"
  }

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    binding = flutterPluginBinding
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    val displayMetrics = context.resources.displayMetrics

    when (call.method) {
      "getDensity" -> result.success(displayMetrics.density)
      "getDensityDpi" -> result.success(displayMetrics.densityDpi)
      "getPixels" -> result.success(TypedValue.applyDimension(
              TypedValue.COMPLEX_UNIT_DIP,
              1.0f,
              displayMetrics
      ))
      "getScalePixels" -> result.success(TypedValue.applyDimension(
              TypedValue.COMPLEX_UNIT_SP,
              1.0f,
              displayMetrics
      ))
      "getPoint" -> result.success(TypedValue.applyDimension(
              TypedValue.COMPLEX_UNIT_PT,
              1.0f,
              displayMetrics
      ))
      else -> result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(activityBinding: ActivityPluginBinding) {
    context = activityBinding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    context = binding.applicationContext
  }

  override fun onReattachedToActivityForConfigChanges(activityBinding: ActivityPluginBinding) {
    context = activityBinding.activity
  }

  override fun onDetachedFromActivity() {
    context = binding.applicationContext
  }
}
