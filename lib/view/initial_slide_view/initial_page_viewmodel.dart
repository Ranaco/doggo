import 'package:stacked/stacked.dart';
import 'package:doggo/states/initial_app_state.dart';

class InitialSlideViewModel extends BaseViewModel{
  int page = 0;
  InitialSlideViewModel(){
    InitialAppState initialAppState = InitialAppState();
    initialAppState.firstDone();

  }
  setPage(int page){
    this.page = page;
    notifyListeners();
  }
}