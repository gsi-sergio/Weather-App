

import 'package:weather_app/domain/weather/entities/index.dart';

class WindDto {
  final double? speed;
  final int? deg;
  final double? gust;

  const WindDto({
    this.speed,
    this.deg,
    this.gust,
    });

  factory WindDto.fromJson(Map<String, dynamic> json) => WindDto(
        speed: json['speed'] as double?,
        deg: json['deg'] as int?,
        gust: json['gust'] as double?,
      );
  

  factory WindDto.fromDomain(WindEntity response) {
    return WindDto(
      speed: response.speed,
      deg: response.degrees,
      gust: response.gust,
    );
  }

}

extension WindEntityX on WindDto {
  WindEntity toDomain() {
    return WindEntity(
      speed: speed!,
      degrees: deg!,
      gust: gust,
    );
  }
}