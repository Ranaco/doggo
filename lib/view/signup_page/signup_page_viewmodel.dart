import 'package:stacked/stacked.dart';

import '../../sevices/auth_service.dart';

class SignUpPageViewModel extends BaseViewModel{
  String email = "";
  String password = "";
  String name = "";
  String bio = "";

  String confPassword = "";

  bool showPass = true;
  bool showConfPass = true;

  toggleShowPass(){
    showPass = !showPass;
    notifyListeners();
  }

  toggleShowConfPass(){
    showConfPass = !showConfPass;
    notifyListeners();
  }
  signUp() async {
    AuthService().signUp(email: email, password: password, name: name, bio: bio,);
  }
}