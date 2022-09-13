import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

typedef ActionCallback<T> = Future<T> Function();
typedef ActionNotFutureCallback<T> = T Function();
typedef ParseException<T> = T Function(dynamic ex);
mixin ErrorHandling<F> {
  Future<Either<F, T>> process<T>({
    required ActionCallback<T> action,
    ParseException<F>? onFail,
  }) async {
    final logger = Logger();
    try {
      final result = await action();
      return right(result);
    } catch (e, trace) {
      logger.e('EXCEPTION:', e.toString(), trace);
      return left(onFail!(e));
    }
  }

  Either<F, T> processNotFuture<T>({
    required ActionNotFutureCallback<T> action,
    ParseException<F>? onFail,
  }) {
    final logger = Logger();
    try {
      final result = action();
      return right(result);
    } catch (e, trace) {
      logger.e('EXCEPTION:', e.toString(), trace);
      return left(onFail!(e));
    }
  }
}
