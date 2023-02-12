part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

//<editor-fold desc="User status">
// User status state.
abstract class UserStatusState extends UserState {
  const UserStatusState();
}

// Initial state.
class UserSignedOutState extends UserStatusState {
  const UserSignedOutState();
}

// User Signed in state.
class UserSignedInState extends UserStatusState {
  final User user;

  const UserSignedInState({required this.user});

  @override
  List<Object?> get props => [user];
}
//</editor-fold>

// <editor-fold desc="Registration status">
abstract class RegisterState extends UserState {
  const RegisterState();
}

class RegisterProcessingState extends RegisterState {
  const RegisterProcessingState();
}

class WeakPasswordState extends RegisterState {
  const WeakPasswordState();
}

class EmailAlreadyInUseState extends RegisterState {
  const EmailAlreadyInUseState();
}

class InvalidEmailState extends RegisterState {
  const InvalidEmailState();
}

class RegisterFailureState extends RegisterState {
  const RegisterFailureState();
}
// </editor-fold>

// <editor-fold desc="Sign in status">
abstract class SignInState extends UserState {
  const SignInState();
}

class SignInProcessingState extends SignInState {
  const SignInProcessingState();
}

class WrongCredentialsState extends SignInState {
  const WrongCredentialsState();
}

class SignInFailureState extends SignInState {
  const SignInFailureState();
}
// </editor-fold>

// <editor-fold desc="Sign out status">
abstract class SignOutState extends UserState {
  const SignOutState();
}

class SignOutProcessingState extends SignOutState {
  const SignOutProcessingState();
}

class SignOutFailureState extends SignOutState {
  const SignOutFailureState();
}
// </editor-fold>



