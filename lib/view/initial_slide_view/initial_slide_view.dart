import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doggo/assets/global_data.dart';
import 'package:doggo/states/first_page_state.dart';
import 'package:doggo/theme/constants.dart';
import '../../assets/custom_elevated_button.dart';
import '../../theme/theme_state.dart';
import '../home_page/homepage_view.dart';

class InitialSlideView extends StatefulWidget {
  const InitialSlideView({Key? key}) : super(key: key);

  @override
  State<InitialSlideView> createState() => _InitialSlideViewState();
}

class _InitialSlideViewState extends State<InitialSlideView> {
  @override
  Widget build(BuildContext context) {
    var firstPageState = Provider.of<FirstPageState>(context);

    return Scaffold(
        body: Stack(
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          controller: firstPageState.pageController,
          onPageChanged: (page) {
            firstPageState.setPage(page);
            firstPageState.pageScroll(firstPageState.page);
          },
          children: const [
            FirstPage(),
            SecondPage(),
            ThirdPage(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.90,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                        child: AnimatedContainer(
                          width: 25,
                          height: MediaQuery.of(context).size.height *
                                  firstPageState.whatToMultiply -
                              25,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: const Duration(milliseconds: 500),
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Provider.of<CustomTheme>(context).isDark
                              ? Constants.ice0
                              : Constants.nord0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40,
          right: 3,
          child: Text((firstPageState.page + 1).toString() + "/3"),
        )
      ],
    ));
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    var firstPageState = Provider.of<FirstPageState>(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Manage your',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.useColorMode(
                            Constants.ice0, Constants.nord0),
                        fontSize: 30)),
                TextSpan(
                    text: '\nlife & everything \nwith ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomTheme.useColorMode(
                            Constants.ice0, Constants.nord0),
                        fontSize: 30)),
                const TextSpan(
                    text: 'doggo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.red,
                      decoration: TextDecoration.underline,
                      fontSize: 30,
                      decorationThickness: 2,
                      decorationColor: Constants.red,
                    ))
              ])),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: CustomElevatedButton(
                    onTap: () {
                      firstPageState.setPage(firstPageState.page + 1);
                      firstPageState.pageScroll(firstPageState.page);
                    },
                    text: 'Next',
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var firstPageState = Provider.of<FirstPageState>(context);

    return Scaffold(
        body: Column(children: [
      const Spacer(
        flex: 1,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: CustomElevatedButton(
              text: "Next",
              onTap: () {
                firstPageState.setPage(firstPageState.page + 1);
                firstPageState.pageScroll(firstPageState.page);
              },
            ),
          ),
        ],
      )
    ]));
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      const Spacer(),
      InkWell(
        splashColor: Constants.face,
        onTap: () {},
        child: Container(),
      ),
      Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 20),
        child: CustomElevatedButton(
          onTap: () {
            GlobalData.takeToHomePage();
          },
        ),
      ),
    ])));
  }
}
