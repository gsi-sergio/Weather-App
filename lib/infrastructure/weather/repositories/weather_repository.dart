import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/error_handler/index.dart';
import 'package:weather_app/domain/weather/datasources/index.dart';
import 'package:weather_app/domain/weather/entities/weather_data_entity.dart';
import 'package:weather_app/domain/weather/entities/coord_entity.dart';
import 'package:weather_app/domain/weather/repositories/index.dart';
import 'package:weather_app/infrastructure/weather/dtos/index.dart';

class WeatherRepository
    with ErrorHandling<Failure>
    implements IWeatherRepository {
  final IWeatherRemoteDao remote;

  WeatherRepository({required this.remote});

  @override
  Future<Either<Failure, WeatherDataEntity>> getCurrentWeather({required CoordEntity coord}) async {
    return process<WeatherDataEntity>(
      action: () async {
        final dto = CoordDto.fromDomain(coord);
        final response = await remote.getCurrentWeather(dto);
        return response.toDomain();
      },
      onFail: (_) => GenericFailure(),
    );
  }
}
