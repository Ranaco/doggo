import 'dart:developer';

import 'package:doggo/states/initial_app_state.dart';
import 'package:flutter/material.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class GlobalData {
  static final _appRouter = locator<AppRouter>();

  static takeToHomePage() {
    InitialAppState initialAppState = InitialAppState();
    initialAppState.firstDone().then((value) {
      _appRouter.replace(const HomePageRoute());
    });
  }

  static popPage() {
    _appRouter.pop();
  }

  static snackBarEvent(String event){
    locator<SnackbarService>().showSnackbar(message: event);
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
