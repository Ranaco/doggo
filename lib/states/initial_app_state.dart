import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class InitialAppState extends ChangeNotifier{
    int first = 0;

    firstDone() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('first', 1);
    }

    Future<int?> getFirst() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? num = prefs.getInt('first');
      return num;
    }
}

