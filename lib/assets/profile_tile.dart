import 'package:doggo/app/app.locator.dart';
import 'package:doggo/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';

class ProfileTile extends StatelessWidget {
  final String name;
  final String bio;
  final String profilePic;
  const ProfileTile(
      {Key? key,
      required this.name,
      required this.bio,
      this.profilePic =
          "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<CustomTheme>(context);
    Color upColor = CustomTheme.useColorMode(Constants.nord0, Constants.ice0);
    Color downColor =
        CustomTheme.useColorMode(Colors.grey.shade900, Colors.grey.shade400);

    Offset forwardOffset = const Offset(-2, -2);
    Offset downOffset = const Offset(5, 5);

    return GestureDetector(
      onTap: () {
        locator<AppRouter>().navigate(const ProfilePageRoute());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 150,
        decoration: BoxDecoration(
            color: CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
            borderRadius: BorderRadius.circular(10),
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
            ]),
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            ClipOval(
                child: Image.network(
              profilePic,
              height: 70,
              width: 70,
            )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 10, bottom: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 30,
                    width: 130,
                    child: Row(
                      children: [
                        Flexible(
                          child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: bio,
                                  style: TextStyle(
                                      color: CustomTheme.useColorMode(
                                          Constants.ice0, Constants.nord0)))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Feather.chevron_right,
                color:
                    CustomTheme.useColorMode(Constants.ice0, Constants.nord0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
