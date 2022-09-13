import 'package:get/get.dart';
import 'package:weather_app/application/weather/index.dart';
import 'package:weather_app/core/service_container/index.dart';
import 'package:weather_app/domain/weather/repositories/index.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherController>(
      () => WeatherController(
        weatherRepository: sl<IWeatherRepository>(),
        screenArgs: Get.arguments
      ),
      fenix: false,
    );
  }
}
