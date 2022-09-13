

import 'package:weather_app/domain/weather/datasources/index.dart';
import 'package:weather_app/infrastructure/core/rest_api/http_clients/index.dart';
import 'package:weather_app/infrastructure/core/rest_api/index.dart';
import 'package:weather_app/infrastructure/weather/dtos/index.dart';

class WeatherRemoteDao implements IWeatherRemoteDao {
  final PublicAccessRestClient restAPIClient;

  WeatherRemoteDao({required this.restAPIClient});

  @override
  Future<WeatherResponseDto> getCurrentWeather(CoordDto coord) async {
    var _parameters = coord.toJson();
    _parameters.addEntries((<String, String>{'appid': API_KEY, 'units': 'metric'}).entries);
   final response = await restAPIClient.load(
      resource: Endpoints.WEATHER,
      queryParameters: _parameters,
    );
    final json =
        response as Map<String, dynamic>;
    return WeatherResponseDto.fromJson(json);
  }
}
