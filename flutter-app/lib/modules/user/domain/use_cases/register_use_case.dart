import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_management/failure.dart';

// Register new user with first name, last name, email, and password.
Future<User> registerUseCase(String email, String password) async {
  return runSafetyFuture(
    () async {
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return user;
      }

      return Future.error(const RegistrationGenericFailure());
    },
    onException: (exception) {
      if (exception is FirebaseAuthException) {
        if (exception.code == 'weak-password') {
          return const WeakPasswordFailure();
        }
        if (exception.code == 'email-already-in-use') {
          return const EmailAlreadyInUseFailure();
        }
        if (exception.code == 'invalid-email') {
          return const InvalidEmailFailure();
        }
      }

      return const RegistrationGenericFailure();
    },
  );
}

// Register failure types.
// ignore: prefer-match-file-name
class RegistrationGenericFailure extends Failure {
  const RegistrationGenericFailure()
      : super(
          code: 'registration-generic-failure',
          message: 'Registration failed.',
        );
}

class WeakPasswordFailure extends Failure {
  const WeakPasswordFailure()
      : super(
          code: 'weak-password-failure',
          message: 'The password provided is too weak.',
        );
}

class EmailAlreadyInUseFailure extends Failure {
  const EmailAlreadyInUseFailure()
      : super(
          code: 'email-already-in-use-failure',
          message: 'The email provided is already in use.',
        );
}

class InvalidEmailFailure extends Failure {
  const InvalidEmailFailure()
      : super(
          code: 'invalid-email-failure',
          message: 'The email provided is invalid.',
        );
}
