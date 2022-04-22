import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:doggo/app/auth.guard.dart';
import 'package:doggo/view/add_task_page/add_task_page_view.dart';
import 'package:doggo/view/initial_slide_view/initial_slide_view.dart';
import 'package:doggo/view/login_page/login_page_view.dart';
import 'package:doggo/view/settings_page/settings_page_view.dart';
import 'package:doggo/view/signup_page/signup_page_view.dart';
import '../view/home_page/homepage_view.dart';
part './app.router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'View,Route', routes: <AutoRoute>[
  AutoRoute(
    page: HomePageView,
    initial: true,
    guards: [AuthGuard],
  ),
  AutoRoute(
    page: InitialSlideView,
  ),
  AutoRoute(
    page: LoginPageView,
  ),
  AutoRoute(
    page: SignUpPageView,
  ),
  AutoRoute(page: AddTaskView),
  AutoRoute(
    page: SettingsPageView,
  )
])
@singleton
class AppRouter extends _$AppRouter {
  AppRouter()
      : super(
            authGuard: AuthGuard(), navigatorKey: StackedService.navigatorKey);
}
