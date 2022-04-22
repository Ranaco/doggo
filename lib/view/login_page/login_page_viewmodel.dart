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

  takeToSignUpPage() async {
    _appRouter.navigate(const SignUpPageRoute());
  }
}
