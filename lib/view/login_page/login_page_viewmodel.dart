import 'package:doggo/sevices/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';

class LoginPageViewModel extends BaseViewModel {
  String email = "";
  String password = "";
  bool suffixPressed = true;

  final _appRouter = locator<AppRouter>();

  toggleIsPass() {
    suffixPressed = !suffixPressed;
    notifyListeners();
  }

  login() async {
    await AuthService().signIn(email: email, password: password);
  }

  takeToSignUpPage() async {
    _appRouter.navigate(const SignUpPageRoute());
  }
}
