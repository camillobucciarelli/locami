import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failure/failure.dart';
import '../../data/models/user_filters.dart';
import '../../data/models/user_record.dart';
import '../../../_commons/models/list_filters.dart';
import '../../data/models/user_roles.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, void>> sendVerificationEmail();

  Future<Either<Failure, User>> signIn({required String email, required String password});

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, User>> reloadUser();

  Either<Failure, User> currentUser();

  Future<Either<Failure, User>> updateUserClaims({required UserRoles role});

  Future<Either<Failure, List<UserRecord>>> getUsers({required UserFilters filters});
}
