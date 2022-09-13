import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  final double speed;
  final int degrees;
  final double? gust;

  const WindEntity({
    required this.speed,
    required this.degrees,
    this.gust,
  });

  WindEntity copyWith({
    double? speed,
    int? degrees,
    double? gust,
  }) =>
      WindEntity(
        speed: speed ?? this.speed,
        degrees: degrees ?? this.degrees,
        gust: gust ?? this.gust,
      );

  @override
  List<Object?> get props => [
        speed,
        degrees,
        gust,
      ];
}
