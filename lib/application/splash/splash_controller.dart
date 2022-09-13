import 'dart:async';
import 'package:get/get.dart';
import 'package:weather_app/core/navigation/index.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    /// Timer to control the execution time of the first animation
    Timer(const Duration(seconds: 6), onDoneLoading);
  }

  Future onDoneLoading() async {
    Get.offNamed(Routes.WEATHER);
  }
}
