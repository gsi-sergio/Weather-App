import 'package:get/get.dart';
import 'package:weather_app/core/navigation/index.dart';
import 'package:weather_app/domain/app/bindings/index.dart';
import 'package:weather_app/domain/weather/bindings/index.dart';
import 'package:weather_app/presentation/index.dart';

class BillPayNav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.WEATHER,
      page: () => WeatherPage(),
      binding: WeatherBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_PLACE,
      page: () => SearchPlacePage(),
    ),
  ];
}
