import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';
import 'package:doggo/models/user_model.dart';
import 'package:doggo/sevices/could_database_service.dart';
import 'package:doggo/states/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@singleton
class AuthService{
  final instance = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  bool get isAuthenticated => user != null;

  //Finish the problem with the user fetch and login or signup problems

  Future<UserCredential?> signUp  ({
  required String email,
    required String password,
    required String name,
    String? avatar_url,
    String bio = "Hello there",
}) async {

      UserCredential user = await instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        UserModel userModel = UserModel(name: name, email: value.user!.email!, id: value.user!.uid, date_created: DateTime.now(), avatar_url: avatar_url ?? "https://firebasestorage.googleapis.com/v0/b/doggo-save.appspot.com/o/profile.png?alt=media&token=589fbd2f-e39b-485d-87d6-92eb5ac3f7cc",
          bio: bio,);
        CloudDatabaseService().create(userModel.toJson(),  collection: "Users").then((value) {
          signIn(email: email, password: password).then((value) {
            locator<AppRouter>().replace(const HomePageRoute());
          });
        });
        return value;
      });
      locator<SnackbarService>().showSnackbar(message: "Account successfully created!");
      return user;

  }

  Future<UserCredential> signIn({
    required String email,
    required String password,
}) async {
    UserCredential user = await instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
      locator<AppRouter>().replace(const HomePageRoute()).then((value) {
        UserData().getUser();
      });
      return value;
    });
    showSnackBar('Welcome back ${UserData.user.name}!');
    return user;
  }

  showSnackBar(dynamic data, ) async {
    var snackBarService = locator<SnackbarService>();
     snackBarService.showSnackbar(message: data.toString(),);
  }

}