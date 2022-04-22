import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';

class GlobalData {
  static final _appRouter = locator<AppRouter>();

  static takeToHomePage() {
    _appRouter.replace(const HomePageRoute());
    log("there");
  }

  static popPage() {
    _appRouter.pop();
  }

  static takeToAddPage() {
    // _appRouter.navigate(const AddTaskRoute());
    print('This is data');
  }
}

class MyBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
