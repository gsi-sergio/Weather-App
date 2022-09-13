import '../index.dart';

class RequireInternetConnection extends Failure {
  @override
  IMessage get message => WarningMessage(
    'This option requires an Internet connection. Verify your connection status.',
    'Internet connection');

  @override
  List<Object> get props => [message];
}