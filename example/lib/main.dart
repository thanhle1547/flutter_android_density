import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_android_density/flutter_android_density.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformDensity = 'Unknown';
  String _platformDensityDpi = 'Unknown';
  String _platformPixels = 'Unknown';
  String _platformScalePixels = 'Unknown';
  String _platformPoint = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformDensity;
    String platformDensityDpi;
    String platformPixels;
    String platformScalePixels;
    String platformPoint;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      final double? density = await FlutterAndroidDensity.getDensity();
      platformDensity = density?.toString() ?? 'Unknown platform density';
    } on PlatformException {
      platformDensity = 'Failed to get platform density.';
    }

    try {
      final int? densityDpi = await FlutterAndroidDensity.getDensityDpi();
      platformDensityDpi = densityDpi?.toString() ?? 'Unknown platform density dpi';
    } on PlatformException {
      platformDensityDpi = 'Failed to get platform density dpi.';
    }

    try {
      final double? pixels = await FlutterAndroidDensity.getPixels();
      platformPixels = pixels?.toString() ?? 'Unknown platform pixels';
    } on PlatformException {
      platformPixels = 'Failed to get platform pixels.';
    }

    try {
      final double? scalePixels = await FlutterAndroidDensity.getScalePixels();
      platformScalePixels = scalePixels?.toString() ?? 'Unknown platform scale pixels';
    } on PlatformException {
      platformScalePixels = 'Failed to get platform scale pixels.';
    }

    try {
      final double? point = await FlutterAndroidDensity.getPoint();
      platformPoint = point?.toString() ?? 'Unknown platform point';
    } on PlatformException {
      platformPoint = 'Failed to get platform point.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformDensity = platformDensity;
      _platformDensityDpi = platformDensityDpi;
      _platformPixels = platformPixels;
      _platformScalePixels = platformScalePixels;
      _platformPoint = platformPoint;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Running on:\n'),
              Text('Density: $_platformDensity'),
              Text('Density dpi: $_platformDensityDpi'),
              Text('Pixels: $_platformPixels'),
              Text('Scale pixels: $_platformScalePixels'),
              Text('Point: $_platformPoint'),
            ],
          ),
        ),
      ),
    );
  }
}
