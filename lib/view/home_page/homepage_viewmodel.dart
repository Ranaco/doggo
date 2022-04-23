import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doggo/sevices/could_database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';

class HomePageViewModel extends BaseViewModel {
  final AppRouter _appRouter = locator<AppRouter>();

  HomePageViewModel(){
    getData();
  }

  getData() async {
   CloudDatabaseService().getData(
       collection: 'Users',
       field: 'id',
       fieldData: FirebaseAuth.instance.currentUser!.uid);
  }

  takeToAddTaskPage() async {
    print('Hello there');
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
