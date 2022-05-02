import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';

import '../../states/user_data.dart';

class HomePageViewModel extends BaseViewModel {
  final AppRouter _appRouter = locator<AppRouter>();

  void takeToDoggoPageView(){
      _appRouter.navigate( DoggoPageRoute(breed: 'dog'));
  }

  getData() async {
    await UserData().getUser();
  }

  takeToAddTaskPage() async {
  }

  takeToSettingsPage() async {
    await _appRouter.navigate(const SettingsPageRoute());
  }
}

class HomePageState extends ChangeNotifier {
  String searchKeyWord = "";

  search(String val) {
    if (searchKeyWord.isNotEmpty) {
      searchKeyWord = val;
      notifyListeners();
    }
  }
}
