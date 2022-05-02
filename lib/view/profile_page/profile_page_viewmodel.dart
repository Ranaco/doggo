import 'package:doggo/assets/global_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';

class ProfileViewModel extends BaseViewModel{

  FirebaseAuth instance = FirebaseAuth.instance;
  final AppRouter _appRouter = locator<AppRouter>();

  void logOut() async {
    await instance.signOut().then((value) async {
      await _appRouter.replace(const LoginPageRoute());
    });
  }
}