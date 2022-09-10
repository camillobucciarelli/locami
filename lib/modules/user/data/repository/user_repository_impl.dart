import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure/catch_exception.dart';
import '../../../../core/failure/failure.dart';
import '../models/user_filters.dart';
import '../models/user_roles.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_record.dart';
import '../data_source/user_data_source.dart';
import '../models/custom_claims.dart';
import '../../../_commons/models/list_filters.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<Either<Failure, User>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    return asyncCatchFailure(() => _userDataSource.register(
          firstName,
          lastName,
          email,
          phoneNumber,
          password,
        ));
  }

  @override
  Future<Either<Failure, User>> reloadUser() {
    return asyncCatchFailure(_userDataSource.reloadUser);
  }

  @override
  Either<Failure, User> currentUser() {
    return catchFailure(_userDataSource.currentUser);
  }

  @override
  Future<Either<Failure, void>> sendVerificationEmail() {
    return asyncCatchFailure(_userDataSource.sendVerificationEmail);
  }

  @override
  Future<Either<Failure, User>> signIn({required String email, required String password}) {
    return asyncCatchFailure(() => _userDataSource.signIn(email, password));
  }

  @override
  Future<Either<Failure, void>> signOut() {
    return asyncCatchFailure(_userDataSource.signOut);
  }

  @override
  Future<Either<Failure, User>> updateUserClaims({required UserRoles role}) {
    return asyncCatchFailure(() => _userDataSource.updateUserClaims(CustomClaims(role: role)));
  }

  @override
  Future<Either<Failure, List<UserRecord>>> getUsers({required UserFilters filters}) {
    return asyncCatchFailure(() => _userDataSource.getUsers(filters));
  }
}
