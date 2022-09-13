

import 'package:weather_app/domain/weather/entities/index.dart';

class MainDataDto {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  const MainDataDto({
    this.temp,
    this.feelsLike,
    this.tempMax,
    this.tempMin,
    this.pressure,
    this.humidity,
    });

  factory MainDataDto.fromJson(Map<String, dynamic> json) => MainDataDto(
        temp: json['temp'] as double?,
        feelsLike: json['feels_like'] as double?,
        tempMin: json['temp_min'] as double?,
        tempMax: json['temp_max'] as double?,
        pressure: json['pressure'] as int?,
        humidity: json['humidity'] as int?,
      );
  

  factory MainDataDto.fromDomain(MainParametersEntity response) {
    return MainDataDto(
      temp: response.temp,
      feelsLike: response.feelsLike,
      tempMax: response.tempMax,
      tempMin: response.tempMin,
      pressure: response.pressure,
      humidity: response.humidity,
    );
  }

}

extension MainParametersEntityX on MainDataDto {
  MainParametersEntity toDomain() {
    return MainParametersEntity(
      temp: temp!,
      feelsLike: feelsLike!,
      tempMax: tempMax!,
      tempMin: tempMin!,
      pressure: pressure!,
      humidity: humidity!,
    );
  }
}