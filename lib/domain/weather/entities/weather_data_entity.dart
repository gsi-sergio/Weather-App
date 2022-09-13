import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/weather/entities/index.dart';

class WeatherDataEntity extends Equatable {
  final CoordEntity coord;
  final List<WeatherEntity> weather;
  final MainParametersEntity main;
  final WindEntity wind;
  final CloudsEntity clouds;
  final String cityName;

  const WeatherDataEntity({
    required this.coord,
    required this.weather,
    required this.main,
    required this.wind,
    required this.clouds,
    required this.cityName,
  });

  WeatherDataEntity copyWith({
    CoordEntity? coord,
    List<WeatherEntity>? weather,
    MainParametersEntity? main,
    WindEntity? wind,
    CloudsEntity? clouds,
    String? cityName,
  }) =>
      WeatherDataEntity(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        main: main ?? this.main,
        wind: wind ?? this.wind,
        clouds: clouds ?? this.clouds,
        cityName: cityName ?? this.cityName,
      );

  @override
  List<Object?> get props => [
        coord,
        weather,
        main,
        wind,
        clouds,
        cityName,
      ];
}
