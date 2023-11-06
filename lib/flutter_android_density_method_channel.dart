import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelFlutterAndroidDensity {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android_density');

  Future<double?> getDensity() async {
    return methodChannel.invokeMethod<double>('getDensity');
  }

  Future<int?> getDensityDpi() async {
    return methodChannel.invokeMethod<int>('getDensityDpi');
  }

  Future<double?> getPixels() async {
    return methodChannel.invokeMethod<double>('getPixels');
  }

  Future<double?> getScalePixels() async {
    return methodChannel.invokeMethod<double>('getScalePixels');
  }

  Future<double?> getPoint() async {
    return methodChannel.invokeMethod<double>('getPoint');
  }
}
