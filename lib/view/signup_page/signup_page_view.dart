import 'dart:ui';

import 'package:doggo/sevices/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:doggo/view/signup_page/signup_page_viewmodel.dart';

import '../../assets/filled_text_field.dart';
import '../../assets/hero_icon.dart';
import '../../assets/icons.dart';
import '../../theme/constants.dart';
import '../../theme/theme_state.dart';

class SignUpPageView extends StatelessWidget {
  const SignUpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    return ViewModelBuilder<SignUpPageViewModel>.reactive(
        viewModelBuilder: () => SignUpPageViewModel(),
        builder: (context, model, child) {
          submit() {
            if (key.currentState!.validate()) {
              key.currentState!.save();
              // print(model.email +
              //     "  " +
              //     model.password +
              //     "  " +
              //     model.confPassword);
            model.signUp();
            }
          }

          return Scaffold(
              body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color:
                    CustomTheme.useColorMode(Constants.nord0, Constants.ice0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 500,
                      right: 70,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Constants.face,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 90,
                      child: Container(
                        height: 180,
                        width: 180,
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
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Form(
                          key: key,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, top: 40, right: 10),
                              child: Column(children: [
                                Text.rich(TextSpan(children: [
                                  const TextSpan(
                                      text: "Start your journey with ",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.clip)),
                                  TextSpan(
                                      text: "US.",
                                      style: GoogleFonts.cedarvilleCursive()
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationColor:
                                                  CustomTheme.useColorMode(
                                                      Constants.face,
                                                      Constants.red),
                                              color: CustomTheme.useColorMode(
                                                  Constants.face,
                                                  Constants.red),
                                              fontSize: 30))
                                ])),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Name",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                FilledTextField(
                                  hintText: "Name",
                                  obscureText: false,
                                  pass: false,
                                  suffix: const Icon(Feather.mail),
                                  validator: (val) {
                                    if(val == null  || val.isEmpty){
                                      return "Name is required";
                                    }
                                  },
                                  onChanged: (value) {
                                    model.name = value!;
                                  },
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
                                    onSuffixPressed: model.toggleShowPass,
                                    suffix: !model.showPass
                                        ? const HeroIcons(icon: HeroIcon.eye)
                                        : const HeroIcons(
                                            icon: HeroIcon.eye_off),
                                    validator: (val) {
                                      if (val!.length < 8) {
                                        return "Password is smaller than 8 digits.";
                                      }
                                    },
                                    obscureText: model.showPass,
                                    pass: true,
                                    hintText: "Password"),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Re-enter password",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                FilledTextField(
                                    onChanged: (val) {
                                      model.confPassword = val!;
                                    },
                                    onSuffixPressed: model.toggleShowConfPass,
                                    suffix: !model.showConfPass
                                        ? const HeroIcons(icon: HeroIcon.eye)
                                        : const HeroIcons(
                                            icon: HeroIcon.eye_off),
                                    validator: (val) {
                                      if (model.password !=
                                          model.confPassword) {
                                        return "Passwords don't match!.";
                                      }
                                    },
                                    obscureText: model.showConfPass,
                                    pass: true,
                                    hintText: "Password"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Bio",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                                FilledTextField(
                                  isTextField: false,
                                  hintText: "Bio",
                                  obscureText: false,
                                  pass: false,
                                  suffix: const Icon(Feather.mail),
                                  onChanged: (value) {
                                    model.bio = value!;
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 30),
                                    child: GestureDetector(
                                      onTap: submit,
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Constants.red),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text("Let's start!",
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ));
        });
  }
}
