import 'package:doggo/states/user_data.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';
import 'package:doggo/view/home_page/homepage_viewmodel.dart';
import "package:flutter/material.dart";
import 'package:stacked/stacked.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              body: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: UserData.user.name),
                        ],
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: model.takeToSettingsPage,
                      child: ClipOval(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 5,
                            child: Image.network(UserData.user.avatar_url,
                            )
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ));
        });
  }
}
