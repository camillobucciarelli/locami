// 📦 Package imports:
import 'package:equatable/equatable.dart';

// Ignored to define parameter.
// ignore: avoid-dynamic
typedef FailureFromExceptionFunction = Failure Function(dynamic e);
typedef FutureOperationFunction<T> = Future<T> Function();
typedef StreamOperationFunction<T> = Stream<T> Function();

class Failure extends Equatable {
  final String code;
  final String message;

  // This is default value.
  // ignore: no-magic-number
  const Failure({this.code = 'no-code', required this.message});

  factory Failure.genericError() => const Failure(code: 'generic-error', message: '');

  factory Failure.offline() => const Failure(code: 'offline', message: '');

  factory Failure.genericFromException(e) => Failure(code: 'exception', message: '$e');

  @override
  List<Object?> get props => [code, message];
}

// Object not found.
class NotFoundFailure extends Failure {
  const NotFoundFailure() : super(code: 'not-found', message: 'Object not found.');
}

// Method that get 2 parameters an async function that describe the operation and a function that get exception and convert it into a failure.
Future<T> runSafetyFuture<T>(
  FutureOperationFunction<T> operation, {
  FailureFromExceptionFunction? onException,
}) async {
  try {
    return await operation();
  } catch (e) {
    if(e is Failure) return Future.error(e);

    return Future.error(onException?.call(e) ?? Failure.genericFromException(e));
  }
}

Stream<T> runSafetyStream<T>(
  StreamOperationFunction<T> operation, {
  FailureFromExceptionFunction? onException,
}) {
  return operation().handleError((e) {
    if(e is Failure) throw e;
    throw onException?.call(e) ?? Failure.genericFromException(e);
  });
}
