import '../index.dart';

class FailWithMessage extends Failure {

  @override
  final IMessage message;

  const FailWithMessage({
    required this.message
  }): super();

  @override
  List<Object> get props => [message];
}

class ConnectionWarnings extends FailWithMessage {
  ConnectionWarnings(): super(message: WarningMessage(
    'This option requires an Internet connection. Verify your connection status.',
    'Internet connection'));
}