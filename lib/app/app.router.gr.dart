// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePageView());
    },
    InitialSlideRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const InitialSlideView());
    },
    LoginPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const LoginPageView());
    },
    SignUpPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SignUpPageView());
    },
    SettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPageView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomePageRoute.name, path: '/', guards: [authGuard]),
        RouteConfig(InitialSlideRoute.name, path: '/initial-slide-view'),
        RouteConfig(LoginPageRoute.name, path: '/login-page-view'),
        RouteConfig(SignUpPageRoute.name, path: '/sign-up-page-view'),
        RouteConfig(SettingsPageRoute.name, path: '/settings-page-view')
      ];
}

/// generated route for
/// [HomePageView]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [InitialSlideView]
class InitialSlideRoute extends PageRouteInfo<void> {
  const InitialSlideRoute()
      : super(InitialSlideRoute.name, path: '/initial-slide-view');

  static const String name = 'InitialSlideRoute';
}

/// generated route for
/// [LoginPageView]
class LoginPageRoute extends PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: '/login-page-view');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [SignUpPageView]
class SignUpPageRoute extends PageRouteInfo<void> {
  const SignUpPageRoute()
      : super(SignUpPageRoute.name, path: '/sign-up-page-view');

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [SettingsPageView]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page-view');

  static const String name = 'SettingsPageRoute';
}
