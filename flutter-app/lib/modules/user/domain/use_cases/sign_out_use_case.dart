import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error_management/failure.dart';

// Sign out user.
Future<void> signOutUseCase() {
  return runSafetyFuture(
    FirebaseAuth.instance.signOut,
    onException: (exception) => const SignOutGenericFailure(),
  );
}

// Sign out failure types.
// ignore: prefer-match-file-name
class SignOutGenericFailure extends Failure {
  const SignOutGenericFailure()
      : super(
          code: 'sign-out-generic-failure',
          message: 'Sign out failed.',
        );
}
