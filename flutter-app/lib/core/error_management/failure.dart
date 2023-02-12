// 📦 Package imports:
import 'package:equatable/equatable.dart';

// Ignored to define parameter.
// ignore: avoid-dynamic
typedef FailureFromExceptionFunction = Failure Function(dynamic e);
typedef OperationFunction<T> = Future<T> Function();

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

// Method that get 2 parameters an async function thath describe the operation and a function that get exception and convert it into a failure.
Future<T> runSafety<T>(
  OperationFunction<T> operation, {
  FailureFromExceptionFunction? onException,
}) async {
  try {
    return await operation();
  } catch (e) {
    return Future.error(onException?.call(e) ?? Failure.genericFromException(e));
  }
}
