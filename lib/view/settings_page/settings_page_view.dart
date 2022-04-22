import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:doggo/assets/global_data.dart';
import 'package:doggo/assets/hero_icon.dart';
import 'package:doggo/assets/icons.dart';
import 'package:doggo/assets/settings_tile.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';
import '../../assets/profile_tile.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<CustomTheme>(context);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: GlobalData.popPage,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Feather.chevron_left,
                        size: 30,
                        color: CustomTheme.useColorMode(
                            Constants.ice1, Constants.nord0),
                      ),
                    ),
                  ),
                ],
              ),
              const Center(child: SizedBox(height: 20)),
              const ProfileTile(
                bio:
                    "hello there this is the biggest thing that I've ever seen",
                name: "Rana",
              ),
              const SizedBox(
                height: 20,
              ),
              SettingsTile(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      context: context,
                      builder: (
                        context,
                      ) {
                        return const ChangeThemeBottomSheet();
                      });
                },
                icon: CustomTheme.mode(HeroIcon.moon, HeroIcon.sun),
                title: "Theme",
                color:
                    CustomTheme.useColorMode(Constants.ice0, Constants.nord0),
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<CustomTheme>(context);

    Widget DarkBox() {
      return GestureDetector(
        onTap: () {
          themeState.changeTheme(true);
          GlobalData.popPage();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
          ),
          child: const ListTile(
            leading: HeroIcons(
              icon: HeroIcon.moon,
              size: 40,
              color: Colors.black,
            ),
            title: Text("Dark"),
          ),
        ),
      );
    }

    Widget LightBox() {
      return GestureDetector(
        onTap: () {
          themeState.changeTheme(false);
          GlobalData.popPage();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
          ),
          child: const ListTile(
            leading: HeroIcons(
              icon: HeroIcon.sun,
              size: 40,
              color: Constants.face,
            ),
            title: Text("Light"),
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTheme.mode(LightBox(), DarkBox()),
          const SizedBox(
            height: 0.5,
          ),
          CustomTheme.mode(DarkBox(), LightBox()),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: GlobalData.popPage,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
              ),
              child: const Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
