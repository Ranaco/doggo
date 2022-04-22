import 'package:doggo/models/user_model.dart';
import 'package:doggo/sevices/could_database_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserData extends ChangeNotifier{
  static UserModel user = UserModel(name: "NaN", email: "NaN", id: "NaN", date_created: DateTime.now());

   getUser() async {
    UserModel userData = await CloudDatabaseService().getUser();
    user = userData;
    notifyListeners();
  }

  UserData(){
     getUser();
  }

}