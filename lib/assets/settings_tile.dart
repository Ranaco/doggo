import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doggo/assets/hero_icon.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';

class SettingsTile extends StatelessWidget {
  final String title;
  final dynamic icon;
  final Function() onTap;
  final Color? color;
  final double? size;

  const SettingsTile(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.title,
      this.color,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<CustomTheme>(context);

    Color upColor = CustomTheme.useColorMode(Constants.nord0, Constants.ice0);
    Color downColor =
        CustomTheme.useColorMode(Colors.grey.shade900, Colors.grey.shade400);

    Offset forwardOffset = const Offset(-2, -2);
    Offset downOffset = const Offset(5, 5);

    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
            boxShadow: [
              !themeState.isDark
                  ? BoxShadow(
                      offset: forwardOffset,
                      blurRadius: 10,
                      color: upColor,
                      spreadRadius: 2)
                  : const BoxShadow(),
              BoxShadow(
                  offset: downOffset,
                  color: downColor,
                  blurRadius: 10,
                  spreadRadius: 2),
            ],
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(color: CustomTheme.useColorMode(Constants.ice0, Constants.nord0), width: 0.7, style: BorderStyle.solid)
          ),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  icon.runtimeType == String
                      ? Image.asset(
                          'assets/icons/image/$icon.png',
                          height: 50,
                          width: 50,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: HeroIcons(
                              icon: icon, color: color, size: size ?? 30),
                        ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ]),
          )),
    );
  }
}
