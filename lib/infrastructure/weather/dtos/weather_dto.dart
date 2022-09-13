

import 'package:weather_app/domain/weather/entities/index.dart';

class WeatherDto {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherDto({
    this.id,
    this.main,
    this.description,
    this.icon,
    });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
        id: json['id'] as int?,
        main: json['main'] as String?,
        description: json['description'] as String?,
        icon: json['icon'] as String?,
      );
  

  factory WeatherDto.fromDomain(WeatherEntity response) {
    return WeatherDto(
      id: response.id,
      main: response.main,
      description: response.description,
      icon: response.icon,
    );
  }

}

extension WeatherEntityX on WeatherDto {
  WeatherEntity toDomain() {
    return WeatherEntity(
      id: id!,
      main: main!,
      description: description!,
      icon: icon,
    );
  }
}