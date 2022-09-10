import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class UserDataSource {
  Future<User> signIn(String email, String password);

  User get currentUser;

  Future<void> signOut();
}

final userNotLoggedInException = Exception('User not logged in');

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  User get currentUser => _firebaseAuth.currentUser ?? (throw userNotLoggedInException);

  @override
  Future<User> signIn(String email, String password) async {
    final credentials = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credentials.user == null) {
      throw userNotLoggedInException;
    }
    return credentials.user!;
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
