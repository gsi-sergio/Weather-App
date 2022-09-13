import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final int id;
  final String main;
  final String description;
  final String? icon;

  const WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    this.icon,
  });

  WeatherEntity copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      WeatherEntity(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];
}
