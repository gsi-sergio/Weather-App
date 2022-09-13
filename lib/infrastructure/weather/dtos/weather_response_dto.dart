

import 'package:weather_app/domain/weather/entities/index.dart';
import 'package:weather_app/infrastructure/weather/dtos/index.dart';

class WeatherResponseDto {
  final CoordDto? coord;
  final List<WeatherDto>? weather;
  final MainDataDto? main;
  final WindDto? wind;
  final CloudsDto? clouds;
  final String? city;

  const WeatherResponseDto({
    this.coord,
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.city,
    });

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) => WeatherResponseDto(
        coord: CoordDto.fromJson(json['coord'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>).map((e) => WeatherDto.fromJson(e as Map<String, dynamic>)).toList(),
        main: MainDataDto.fromJson(json['main'] as Map<String, dynamic>),
        wind: WindDto.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: CloudsDto.fromJson(json['clouds'] as Map<String, dynamic>),
        city: json['name'] as String?,
      );
  

  factory WeatherResponseDto.fromDomain(WeatherDataEntity response) {
    return WeatherResponseDto(
      coord: CoordDto.fromDomain(response.coord),
      weather: response.weather.map((e) =>WeatherDto.fromDomain(e)).toList(),
      main: MainDataDto.fromDomain(response.main),
      wind: WindDto.fromDomain(response.wind),
      clouds: CloudsDto.fromDomain(response.clouds),
      city: response.cityName,
    );
  }

}

extension WeatherDataEntityX on WeatherResponseDto {
  WeatherDataEntity toDomain() {
    return WeatherDataEntity(
      coord: coord!.toDomain(),
      weather: weather!.map((e) => e.toDomain()).toList(),
      main: main!.toDomain(),
      wind: wind!.toDomain(),
      clouds: clouds!.toDomain(),
      cityName: city!,
    );
  }
}