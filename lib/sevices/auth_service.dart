import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService{
  final instance = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  bool get isAuthenticated => user != null;

  Future<UserCredential?> signUp  ({
  required String email,
    required String password,
}) async {
    UserCredential user = await instance.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
}) async {
    UserCredential user = await instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      locator<AppRouter>().replace(const HomePageRoute());
      return value;
    });
    return user;
  }

}