import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';

class WeatherApp extends StatefulWidget {
  final String? initialRoute;
  final Bindings? appBinding;
  final List<GetPage>? appPages;
  final Map<String, dynamic>? initialLocalization;

  const WeatherApp({
    Key? key,
    this.initialRoute,
    this.initialLocalization,
    this.appBinding,
    this.appPages,
  }) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {


  @override
  Widget build(BuildContext context) {
    return SizingBuilder(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        initialBinding: widget.appBinding,
        initialRoute: widget.initialRoute,
        getPages: widget.appPages,
      ),
    );
  }
}
