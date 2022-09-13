import 'package:get/get.dart';
import 'package:weather_app/core/service_container/index.dart';
import 'package:weather_app/domain/weather/repositories/index.dart';
import 'package:weather_app/infrastructure/core/rest_api/index.dart';
import 'package:weather_app/infrastructure/weather/index.dart';

void registerWeatherDependencies() {
  Get.put<IWeatherRepository>(
    WeatherRepository(
      remote: WeatherRemoteDao(restAPIClient: sl<PublicAccessRestClient>()),
    ),
    permanent: true,
  );
}