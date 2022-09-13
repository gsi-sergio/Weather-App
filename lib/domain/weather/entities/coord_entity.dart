import 'package:equatable/equatable.dart';

class CoordEntity extends Equatable {
  final double lon;
  final double lat;

  const CoordEntity({
    required this.lon,
    required this.lat,
  });

  CoordEntity copyWith({
    double? lon,
    double? lat,
  }) =>
      CoordEntity(
        lon: lon ?? this.lon,
        lat: lat ?? this.lat,
      );

  @override
  List<Object?> get props => [
        lon,
        lat,
      ];
}
