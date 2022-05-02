import 'dart:async';
import 'dart:ui';

import 'package:doggo/sevices/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/assets/hero_icon.dart';
import 'package:doggo/assets/icons.dart';
import 'package:doggo/assets/filled_text_field.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';
import 'package:doggo/view/login_page/login_page_viewmodel.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPageViewModel>.reactive(
        viewModelBuilder: () => LoginPageViewModel(),
        builder: (context, model, child) {
          submit() {
            if (key.currentState!.validate()) {
              key.currentState!.save();
              model.login();
            }
          }

          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color:
                    CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 200,
                      right: -10,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          color: Constants.face,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 500,
                      left: 20,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Constants.red, shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, bottom: 10, top: 10),
                            child: Form(
                              key: key,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 0.0, bottom: 30),
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: "Start where you \nleft! ",
                                            style: TextStyle(
                                                fontSize: 35,
                                                fontWeight: FontWeight.bold,
                                                overflow: TextOverflow.clip)),
                                      ])),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Email",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                    FilledTextField(
                                      hintText: "Email",
                                      obscureText: false,
                                      pass: false,
                                      suffix: const Icon(Feather.mail),
                                      validator: (val) {
                                        if (val!.trim().isEmpty) {
                                          return 'Please enter email address.';
                                        } else if (!RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val.trim())) {
                                          return 'Please enter valid email address';
                                        }
                                      },
                                      onChanged: (value) {
                                        model.email = value!;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Password",
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FilledTextField(
                                        onChanged: (val) {
                                          model.password = val!;
                                        },
                                        onSuffixPressed: model.toggleIsPass,
                                        suffix: model.suffixPressed
                                            ? const HeroIcons(
                                                icon: HeroIcon.eye_off)
                                            : const HeroIcons(
                                                icon: HeroIcon.eye),
                                        validator: (val) {
                                          if (val!.length < 8) {
                                            return "Password is smaller than 8 digits.";
                                          }
                                        },
                                        obscureText: model.suffixPressed,
                                        pass: true,
                                        hintText: "Password"),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30,
                                        ),
                                        child: GestureDetector(
                                          onTap: submit,
                                          child: Container(
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Constants.red),
                                            child: const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text("Sign in",
                                                    style: TextStyle(
                                                        fontSize: 20)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("OR",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: CustomTheme.useColorMode(
                                                  Constants.ice0,
                                                  Constants.nord0),
                                            )),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: model.takeToSignUpPage,
                                        child: Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Constants.red),
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Text("Sign up",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }
}
