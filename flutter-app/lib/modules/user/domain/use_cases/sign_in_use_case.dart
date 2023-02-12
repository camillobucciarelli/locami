import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_management/failure.dart';

// Sign in user with email and password.
Future<User> signInUseCase(String email, String password) async {
  return runSafety(
    () async {
      final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        return user;
      }

      return Future.error(const SignInGenericFailure());
    },
    onException: (exception) {
      if (exception is FirebaseAuthException) {
        return const WrongCredentialsFailure();
      }

      return const SignInGenericFailure();
    },
  );
}

// Sign in failure types.
// ignore: prefer-match-file-name
class SignInGenericFailure extends Failure {
  const SignInGenericFailure()
      : super(
          code: 'sign-in-generic-failure',
          message: 'Sign in failed.',
        );
}

class WrongCredentialsFailure extends Failure {
  const WrongCredentialsFailure()
      : super(
          code: 'wrong-credentials-failure',
          message: 'Wrong credentials.',
        );
}
