import 'package:auto_route/auto_route.dart';
import 'package:doggo/app/app.router.dart';
import 'package:doggo/sevices/auth_service.dart';
import 'package:doggo/states/initial_app_state.dart';

class AuthGuard extends AutoRouteGuard {
  InitialAppState initialAppState = InitialAppState();

  AuthGuard(){
    print("This is the authentication state :: " + AuthService().isAuthenticated.toString());
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await initialAppState.getFirst() != 1) {
      router.push(const InitialSlideRoute());
    } else if(AuthService().isAuthenticated){
      resolver.next(true);
    } else if(!AuthService().isAuthenticated){
      router.push(const LoginPageRoute());
    }
  }
}
