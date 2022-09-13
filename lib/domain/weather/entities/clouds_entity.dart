import 'package:equatable/equatable.dart';

class CloudsEntity extends Equatable {
  final int all;

  const CloudsEntity({
    this.all = 0,
  });

  CloudsEntity copyWith({
    int? all,
  }) =>
      CloudsEntity(
        all: all ?? this.all,
      );

  @override
  List<Object?> get props => [
        all,
      ];
}
