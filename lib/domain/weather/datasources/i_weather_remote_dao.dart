

import 'package:weather_app/infrastructure/weather/dtos/index.dart';

abstract class IWeatherRemoteDao {
  Future<WeatherResponseDto> getCurrentWeather(CoordDto coord);
}
