import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:loggy/loggy.dart';

import '../../../../core/failure/failure.dart';
import '../../data/models/custom_claims.dart';
import '../../data/models/user_roles.dart';
import '../../domain/repositories/user_repository.dart';

part 'user_state.dart';

@lazySingleton
class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;
  Timer? _emailVerificationTimer;

  UserCubit(this._userRepository)
      : super(_userRepository.currentUser().fold(
              (_) => UserNotLogged(),
              UserSignedIn.new,
            ));

  Future<void> init() async {
    _userRepository.currentUser().fold(
          (_) => emit(UserNotLogged()),
          (user) async => emit(UserSignedIn(user, await user.customClaims())),
        );
  }

  Future<void> signIn(Map<String, Object?> value) async {
    emit(const SignInProgress());
    final result = await _userRepository.signIn(
      email: value['email'] as String,
      password: value['password'] as String,
    );
    result.fold(
      (failure) => emit(SignInFailure(failure)),
      (user) async => emit(UserSignedIn(user, await user.customClaims())),
    );
  }

  Future<void> register(Map<String, Object?> value) async {
    emit(const RegisterProgress());
    final result = await _userRepository.register(
      firstName: value['firstName'] as String,
      lastName: value['lastName'] as String,
      email: value['email'] as String,
      phoneNumber: value['phoneNumber'] as String,
      password: value['password'] as String,
    );
    result.fold(
      (f) => emit(RegisterFailure(f)),
      (user) async => emit(UserSignedIn(user, await user.customClaims())),
    );
  }

  void listenEmailVerificationChanges() {
    _emailVerificationTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      (await _userRepository.reloadUser()).foldRight(null, (user, _) async {
        logDebug('email verified: ${user.emailVerified}');
        if (user.emailVerified) {
          _emailVerificationTimer?.cancel();
          emit(UserSignedIn(user, await user.customClaims()));
          emit(const EmailVerified());
        }
      });
    });
  }

  Future<void> sendVerificationEmail() async {
    emit(const SendEmailVerificationProgress());
    final result = await _userRepository.sendVerificationEmail();
    result.fold(
      (f) => emit(SendEmailVerificationFailure(f)),
      (_) => emit(const SendEmailVerificationSuccess()),
    );
  }

  Future<void> updateUserRole(UserRoles role) async {
    emit(const ChangeUserClaimsProgress());
    final result = await _userRepository.updateUserClaims(role: role);
    result.fold(
          (failure) => emit(ChangeUserClaimsFailure(failure)),
          (user) async {
            emit(const ChangeUserClaimsSuccess());
            emit(UserSignedIn(user, await user.customClaims()));
          },
    );
  }

  Future<void> signOut() async {
    emit(const SignOutProgress());
    _emailVerificationTimer?.cancel();
    final result = await _userRepository.signOut();
    result.fold(
      (f) => emit(RegisterFailure(f)),
      (_) => emit(UserNotLogged()),
    );
  }
}
