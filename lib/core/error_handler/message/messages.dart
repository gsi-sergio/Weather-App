import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

enum MessageType {
  error,
  warning,
  info,
  success
}

abstract class IMessage {
  MessageType get type;
  String get title;
  String get body;
}

class InternetConnection extends Equatable implements IMessage {
  @override
  MessageType get type => MessageType.warning;

  @override
  String get body => 'This option requires an Internet connection. '
      'Verify your connection status.';

  @override
  String get title => 'Internet connection';

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is InternetConnection;

  @override
  // ignore: unnecessary_overrides
  int get hashCode =>
    super.hashCode;

  @override
  List<Object> get props => [body, title, type];

}

class GenericServerFails implements IMessage {
  @override
  MessageType get type => MessageType.error;

  @override
  String get body => 'This option requires an Internet connection. '
      'Verify your connection status.';

  @override
  String get title => 'Warning!';

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
  other is GenericServerFails;

  @override
  int get hashCode =>
    super.hashCode;
}


class ErrorMessage implements IMessage {
  ErrorMessage(
    this._body,
    this._title
  );
  // final String _body;
  final String? _title;
  final String? _body;

  @override
  String get title => _title ?? 'Warning';

  @override
  MessageType get type => MessageType.error;

  @override
  String get body => 'This option requires an Internet connection. '
      'Verify your connection status.';
}

class WarningMessage implements IMessage {
  WarningMessage(
    this._body,
    this._title
  );
  final String _body;
  final String _title;

  @override
  String get title => _title;

  @override
  MessageType get type => MessageType.warning;

  @override
  String get body => _body;
}


class SuccessMessage implements IMessage {
  SuccessMessage(
    this._body,
    this._title
  );
  final String _body;
  final String _title;

  @override
  String get title => _title;

  @override
  MessageType get type => MessageType.success;

  @override
  String get body => _body;
}

class InfoMessage implements IMessage {
  InfoMessage(
    this._body,
    this._title
  );
  final String _body;
  final String _title;

  @override
  String get title => _title;

  @override
  MessageType get type => MessageType.info;

  @override
  String get body => _body;
}