part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserNotLogged extends UserState {
  @override
  List<Object> get props => [];
}

class UserSignedIn extends UserState {
  final User user;
  final CustomClaims? customClaims;

  const UserSignedIn(this.user, [this.customClaims]);

  @override
  List<Object?> get props => [user, customClaims];
}

class EmailVerified extends UserState {
  const EmailVerified();

  @override
  List<Object> get props => [];
}

// *************************************************************************************************
// Sign in
// *************************************************************************************************
abstract class SignInActionState extends UserState {
  const SignInActionState();
}

class SignInProgress extends SignInActionState {
  const SignInProgress();

  @override
  List<Object> get props => [];
}

class SignInFailure extends SignInActionState {
  final Failure failure;

  const SignInFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

// *************************************************************************************************
// Register
// *************************************************************************************************
abstract class RegisterActionState extends UserState {
  const RegisterActionState();
}

class RegisterProgress extends RegisterActionState {
  const RegisterProgress();

  @override
  List<Object> get props => [];
}

class RegisterFailure extends RegisterActionState {
  final Failure failure;

  const RegisterFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

// *************************************************************************************************
// Email verification
// *************************************************************************************************
abstract class EmailVerificationActionState extends UserState {
  const EmailVerificationActionState();
}

class SendEmailVerificationProgress extends EmailVerificationActionState {
  const SendEmailVerificationProgress();

  @override
  List<Object> get props => [];
}

class SendEmailVerificationFailure extends EmailVerificationActionState {
  final Failure failure;

  const SendEmailVerificationFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class SendEmailVerificationSuccess extends EmailVerificationActionState {
  const SendEmailVerificationSuccess();

  @override
  List<Object> get props => [];
}

// *************************************************************************************************
// Change user claims
// *************************************************************************************************
abstract class ChangeUserClaimsActionState extends UserState {
  const ChangeUserClaimsActionState();
}

class ChangeUserClaimsProgress extends EmailVerificationActionState {
  const ChangeUserClaimsProgress();

  @override
  List<Object> get props => [];
}

class ChangeUserClaimsFailure extends EmailVerificationActionState {
  final Failure failure;

  const ChangeUserClaimsFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

class ChangeUserClaimsSuccess extends EmailVerificationActionState {
  const ChangeUserClaimsSuccess();

  @override
  List<Object> get props => [];
}

// *************************************************************************************************
// Sign out
// *************************************************************************************************
abstract class SignOutActionState extends UserState {
  const SignOutActionState();
}

class SignOutProgress extends SignOutActionState {
  const SignOutProgress();

  @override
  List<Object> get props => [];
}

class SignOutFailure extends SignOutActionState {
  final Failure failure;

  const SignOutFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
