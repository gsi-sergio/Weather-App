import '../index.dart';

class GenericFailure extends Failure {
  @override
  final message = GenericServerFails();

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is GenericFailure;

  @override
  int get hashCode =>
    super.hashCode ^
    message.hashCode;

  @override
  List<Object> get props => [message];
}