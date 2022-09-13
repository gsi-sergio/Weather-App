import 'package:get/get.dart';
import 'package:weather_app/infrastructure/core/rest_api/index.dart';

import 'service_container_dependencies/index.dart';

T sl<T>() => Get.find<T>();

Future<void> registerServiceContainer() async {

  Get.put<PublicAccessRestClient>(PublicAccessRestClient(), permanent: true);

  registerWeatherDependencies();
}
