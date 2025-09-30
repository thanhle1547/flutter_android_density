package com.tl.flutter.plugin.android_density.android_density

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.test.Test
import org.mockito.Mockito
import androidx.test.core.app.ApplicationProvider

/*
 * This demonstrates a simple unit test of the Kotlin portion of this plugin's implementation.
 *
 * Once you have built the plugin's example app, you can run these tests from the command
 * line by running `./gradlew testDebugUnitTest` in the `example/android/` directory, or
 * you can run them directly from IDEs that support JUnit such as Android Studio.
 */

internal class FlutterAndroidDensityPluginTest {
  @Test
  fun onMethodCall_getDensity_returnsExpectedValue() {
    val plugin = FlutterAndroidDensityPlugin()

    val call = MethodCall("getDensity", null)
    val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
    plugin.onMethodCall(call, mockResult)

    val displayMetrics = ApplicationProvider.getApplicationContext<Context>().resources.displayMetrics

    Mockito.verify(mockResult).success(displayMetrics.density)
  }
}
