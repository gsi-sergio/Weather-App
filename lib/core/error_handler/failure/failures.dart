import 'package:equatable/equatable.dart';
import '../index.dart';

abstract class Failure extends Equatable {
  const Failure();

  IMessage get message;
}