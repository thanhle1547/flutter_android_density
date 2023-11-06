import 'dart:io';

import 'flutter_android_density_method_channel.dart';

abstract class FlutterAndroidDensity {
  FlutterAndroidDensity._();

  static final MethodChannelFlutterAndroidDensity _instance = MethodChannelFlutterAndroidDensity();

  static DensityConstants density = DensityConstants._();

  /// Get the logical density of the display. This is a scaling factor for
  /// the Density Independent Pixel unit, where one DIP is one pixel on
  /// an approximately 160 dpi screen (for example a 240x320, 1.5"x2" screen),
  /// providing the baseline of the system's display. Thus on a 160dpi screen
  /// this density value will be 1; on a 120 dpi screen it would be .75; etc.
  static Future<double?> getDensity() {
    if (!Platform.isAndroid) return Future.value(null);

    return _instance.getDensity();
  }

  /// Get the screen density expressed as dots-per-inch.
  static Future<int?> getDensityDpi() {
    if (!Platform.isAndroid) return Future.value(null);

    return _instance.getDensityDpi();
  }

  /// Get `1dp` (density-independent pixel) in pixels, based on density scale.
  ///
  /// One dp is a virtual pixel unit that's roughly equal to one pixel on
  /// a medium-density screen (160 dpi, or the "baseline" density).
  /// Android translates this value to the appropriate number of real pixels
  /// for each other density.
  static Future<double?> getPixels() {
    if (!Platform.isAndroid) return Future.value(null);

    return _instance.getPixels();
  }

  /// Get `1dp` (density-independent pixel) in `sp` (scale-independent pixels),
  /// based on density scale.
  ///
  /// A scale-independent pixel (sp) is the same as
  /// a device-independent pixel (dp), with an additional scaling factor
  /// that is based on the font size that the user selects in
  /// the device's system settings.
  static Future<double?> getScalePixels() {
    if (!Platform.isAndroid) return Future.value(null);

    return _instance.getScalePixels();
  }

  /// Get `1dp` (density-independent pixel) in `pt` (points).
  static Future<double?> getPoint() {
    if (!Platform.isAndroid) return Future.value(null);

    return _instance.getPoint();
  }
}

/// The screen density expressed as dots-per-inch.
final class DensityConstants {
  DensityConstants._();

  /// Intermediate density for screens that sit between [low] (120dpi) and [medium] (160dpi).
  final int dpi_140 = 140;

  /// Intermediate density for screens that sit between [medium] (160dpi) and [high] (240dpi).
  final int dpi_180 = 180;

  /// Intermediate density for screens that sit between [medium] (160dpi) and [high] (240dpi).
  final int dpi_200 = 200;

  /// Intermediate density for screens that sit between [medium] (160dpi) and [high] (240dpi).
  final int dpi_220 = 220;

  /// Intermediate density for screens that sit between [high] (240dpi) and [xhigh] (320dpi).
  final int dpi_260 = 260;

  /// Intermediate density for screens that sit between [high] (240dpi) and [xhigh] (320dpi).
  final int dpi_280 = 280;

  /// Intermediate density for screens that sit between [high] (240dpi) and [xhigh] (320dpi).
  final int dpi_300 = 300;

  /// Intermediate density for screens that sit somewhere between [xhigh] (320 dpi) and [xxhigh] (480 dpi).
  final int dpi_340 = 340;

  /// Intermediate density for screens that sit somewhere between [xhigh] (320 dpi) and [xxhigh] (480 dpi).  final int dpi_360 = 360;
  final int dpi_400 = 400;

  /// Intermediate density for screens that sit somewhere between [xhigh] (320 dpi) and [xxhigh] (480 dpi).  final int dpi_420 = 420;
  final int dpi_440 = 440;

  /// Intermediate density for screens that sit somewhere between [xhigh] (320 dpi) and [xxhigh] (480 dpi).
  final int dpi_450 = 450;

  /// Intermediate density for screens that sit somewhere between [xxhigh] (480 dpi) and [xxxhigh] (640 dpi).
  final int dpi_520 = 520;

  /// Intermediate density for screens that sit somewhere between [xxhigh] (480 dpi) and [xxxhigh] (640 dpi).
  final int dpi_560 = 560;

  /// Intermediate density for screens that sit somewhere between [xxhigh] (480 dpi) and [xxxhigh] (640 dpi).
  final int dpi_600 = 600;

  /// The reference density used throughout the system.
  // ignore: non_constant_identifier_names
  final int defaultDpi = 160;

  /// Standard quantized DPI for high-density screens.
  final int high = 240;

  /// Standard quantized DPI for low-density screens.
  final int low = 120;

  /// Standard quantized DPI for medium-density screens.
  final int medium = 160;

  /// This is a secondary density, added for some common screen configurations.
  final int tv = 213;

  /// Standard quantized DPI for extra-high-density screens.
  final int xhigh = 320;

  /// Standard quantized DPI for extra-extra-high-density screens.
  final int xxhigh = 480;

  /// Standard quantized DPI for extra-extra-extra-high-density screens.
  final int xxxhigh = 640;
}
