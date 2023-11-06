// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_android_density/flutter_android_density.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getDensity test', (WidgetTester tester) async {
    final double? density = await FlutterAndroidDensity.getDensity();
    expect(density != null, true);
  });

  testWidgets('getDensityDpi test', (WidgetTester tester) async {
    final int? densityDpi = await FlutterAndroidDensity.getDensityDpi();
    expect(densityDpi != null, true);
  });

  testWidgets('getPixels test', (WidgetTester tester) async {
    final double? pixels = await FlutterAndroidDensity.getPixels();
    expect(pixels != null, true);
  });

  testWidgets('getScalePixels test', (WidgetTester tester) async {
    final double? scalePixels = await FlutterAndroidDensity.getScalePixels();
    expect(scalePixels != null, true);
  });

  testWidgets('getPoint test', (WidgetTester tester) async {
    final double? point = await FlutterAndroidDensity.getPoint();
    expect(point != null, true);
  });
}
