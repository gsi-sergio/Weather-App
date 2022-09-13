import 'package:get/get.dart';
import 'package:weather_app/application/splash/index.dart';
import 'package:weather_app/core/service_container/index.dart';
import 'package:weather_app/domain/weather/repositories/index.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(),
      fenix: true,
    );
  }
}
