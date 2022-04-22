import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirstPageState extends ChangeNotifier{
  int _page = 0;
  late PageController pageController;
  var whatToMultiply = 1/3;

  pageScroll(var change){
    switch(change){
      case 0:
        whatToMultiply = ((90/100 ) * (1/3)) ;
        _page = change;
        break;
      case 1:
        whatToMultiply = (90 / 100)* (2/3) ;
        _page = change;
        break;
      case 2:
        whatToMultiply = 0.90 - 0.008;
        _page = change;
        break;
      default:
        whatToMultiply = 1;
        _page = 2;
        break;
    }
    pageController.animateToPage(_page, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }

  FirstPageState(){
    pageController = PageController(initialPage: _page);
  }

  int get page => _page;

  setPage(int page){
    _page = page;
    notifyListeners();
  }
}