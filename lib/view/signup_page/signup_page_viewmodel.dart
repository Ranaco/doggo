import 'package:stacked/stacked.dart';

class SignUpPageViewModel extends BaseViewModel{
  String email = "";
  String password = "";
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
}