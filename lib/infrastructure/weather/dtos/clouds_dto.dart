

import 'package:weather_app/domain/weather/entities/index.dart';

class CloudsDto {
  final int? all;

  const CloudsDto({this.all});

  factory CloudsDto.fromJson(Map<String, dynamic> json) => CloudsDto(
        all: json['all'] as int?,
      );
  

  factory CloudsDto.fromDomain(CloudsEntity response) {
    return CloudsDto(
      all: response.all,
    );
  }
}

extension CloudsEntityX on CloudsDto {
  CloudsEntity toDomain() {
    return CloudsEntity(
      all: all ?? 0,
    );
  }
}