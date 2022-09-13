import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/core/navigation/index.dart';
import 'package:weather_app/core/service_container/index.dart';
import 'package:weather_app/domain/app/bindings/index.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await registerServiceContainer();
  final initialRoute = await Routes.getInitialRoute;
 runApp(
    WeatherApp(
      initialRoute: initialRoute,
      appBinding: SplashBinding(),
      appPages: BillPayNav.routes,
    ),
  );
}


