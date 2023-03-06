import 'package:firebase_auth/firebase_auth.dart';


User? getCurrentUserUseCase() => FirebaseAuth.instance.currentUser;
