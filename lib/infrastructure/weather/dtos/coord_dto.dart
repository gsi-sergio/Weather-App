

import 'package:weather_app/domain/weather/entities/index.dart';

class CoordDto {
  final double? lon;
  final double? lat;

  const CoordDto({
    this.lon,
    this.lat,
    });

  factory CoordDto.fromJson(Map<String, dynamic> json) => CoordDto(
        lon: json['lon'] as double?,
        lat: json['lat'] as double?
      );
  

  factory CoordDto.fromDomain(CoordEntity response) {
    return CoordDto(
      lon: response.lon,
      lat: response.lat,
    );
  }

  Map<String, dynamic> toJson() => {
        'lon': lon,
        'lat': lat,
      };

}

extension CoordEntityX on CoordDto {
  CoordEntity toDomain() {
    return CoordEntity(
      lon: lon!,
      lat: lat!,
    );
  }
}