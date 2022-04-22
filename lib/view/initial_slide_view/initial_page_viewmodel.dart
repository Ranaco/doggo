import 'package:stacked/stacked.dart';

class InitialSlideViewModel extends BaseViewModel{
  int page = 0;
  setPage(int page){
    this.page = page;
    notifyListeners();
  }
}