import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/extensions/future_extension.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../../domain/use_cases/sign_in_use_case.dart';
import '../../domain/use_cases/sign_out_use_case.dart';

part 'user_state.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserSignedOutState());

  // Register new user with first name, last name, email, and password.
  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    registerUseCase(firstName, lastName, email, password).fold(
      progress: () => emit(const RegisterProcessingState()),
      success: (user) => emit(UserSignedInState(user: user)),
      failure: (failure) {
        if (failure is WeakPasswordFailure) {
          emit(const WeakPasswordState());
        } else if (failure is EmailAlreadyInUseFailure) {
          emit(const EmailAlreadyInUseState());
        } else if (failure is InvalidEmailFailure) {
          emit(const InvalidEmailState());
        } else {
          emit(const RegisterFailureState());
        }
      },
    );
  }

  // Sign in with email and password.
  void signIn({
    required String email,
    required String password,
  }) {
    signInUseCase(email, password).fold(
      progress: () => emit(const SignInProcessingState()),
      success: (user) => emit(UserSignedInState(user: user)),
      failure: (failure) {
        if (failure is WrongCredentialsFailure) {
          emit(const WrongCredentialsState());
        } else {
          emit(const SignInFailureState());
        }
      },
    );
  }

  // Sign out.
  void signOut() {
    signOutUseCase().fold(
      progress: () => emit(const SignOutProcessingState()),
      success: (_) => emit(const UserSignedOutState()),
      failure: (failure) => emit(const SignOutFailureState()),
    );
  }
}
