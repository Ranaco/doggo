import 'package:doggo/sevices/could_database_service.dart';
import 'package:doggo/states/user_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:doggo/app/app.locator.dart';
import 'package:doggo/states/first_page_state.dart';
import 'package:doggo/states/initial_app_state.dart';
import 'package:doggo/theme/theme_state.dart';
import 'package:doggo/view/home_page/homepage_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.router.dart';

main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    InitialAppState initialAppState = InitialAppState();
    initialAppState.firstDone();
    UserData();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    setupLocator();
    runApp(
        const BaseApp(),
    );
}

class BaseApp extends StatefulWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  State<BaseApp> createState() => _BaseAppState();

}

class _BaseAppState extends State<BaseApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
            ChangeNotifierProvider<FirstPageState>(create: (_) => FirstPageState(),),
            ChangeNotifierProvider<CustomTheme>(create: (_) => CustomTheme(),),
            ChangeNotifierProvider<HomePageState>(create: (_) => HomePageState(),)
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

