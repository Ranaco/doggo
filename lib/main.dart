import 'package:doggo/firebase_options.dart';
import 'package:doggo/states/user_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/states/first_page_state.dart';
import 'package:doggo/theme/theme_state.dart';
import 'package:doggo/view/home_page/homepage_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';
import 'app/app.router.dart';

main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    setupLocator();
    setupSnackBarUi();
    runApp(
        const BaseApp(),
    );
}

void setupSnackBarUi() {
  final service = locator<SnackbarService>();

  service.registerSnackbarConfig(SnackbarConfig(
    backgroundColor: const Color(0xFF303030),
    textColor: Colors.white,
    messageColor: Colors.white,
    mainButtonTextColor: Colors.black,
    animationDuration: const Duration(milliseconds: 800),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
  ));
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
            ChangeNotifierProvider<FirstPageState>(create: (_) => FirstPageState(),),
            ChangeNotifierProvider<CustomTheme>(create: (_) => CustomTheme(),),
            ChangeNotifierProvider<HomePageState>(create: (_) => HomePageState(),),
            ChangeNotifierProvider<UserData>(create: (_) => UserData(),),
        ],
        child: const MyApp(),
    );
  }
}


class MyApp extends StatelessWidget{
    const MyApp({Key? key}):super(key: key);

    @override
        Widget build(BuildContext context){
        var themeState = Provider.of<CustomTheme>(context);
            var _appRouter = locator<AppRouter>();
            return  MaterialApp.router(
                theme: themeState.getTheme(),
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                routeInformationProvider: _appRouter.routeInfoProvider(),
                debugShowCheckedModeBanner: false,
            );
        }
}

