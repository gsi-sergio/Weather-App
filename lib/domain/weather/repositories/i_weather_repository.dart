import 'package:dartz/dartz.dart';
import 'package:weather_app/core/error_handler/index.dart';
import 'package:weather_app/domain/weather/entities/coord_entity.dart';
import 'package:weather_app/domain/weather/entities/weather_data_entity.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, WeatherDataEntity>> getCurrentWeather({required CoordEntity coord});
}