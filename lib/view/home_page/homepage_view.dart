import 'package:doggo/states/user_data.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';
import 'package:doggo/view/home_page/homepage_viewmodel.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:stacked/stacked.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  ScrollController scrollController = ScrollController();
  ScrollDirection scrollDirection = ScrollDirection.idle;
  List<Color> colors = [Constants.grey, Constants.orange, Constants.face, Constants.red, Constants.green];
  List<Image> images = [
    Image.asset('assets/images/dog.png'),
    Image.asset('assets/images/cat.png'),
    Image.asset('assets/images/sparrow.png')
  ];

  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        scrollDirection = scrollController.position.userScrollDirection;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        onModelReady: (model) => model.getData(),
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
                    child: SizedBox(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: model.takeToSettingsPage,
                      child: ClipOval(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 5,
                            child: Image.network(
                              UserData.user.avatar_url,
                            )),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child:  Text("Categories", style: TextStyle(
                  fontSize: 30,
                ),),
              ),
              SizedBox(
                child: Center(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3.3,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification){
                          if(notification is ScrollEndNotification){
                            setState(() {
                              scrollDirection = ScrollDirection.idle;
                            });
                          }
                          return true;
                        },
                        child: ScrollConfiguration(
                          behavior: MyBehaviour(),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            scrollDirection: Axis.horizontal,
                            controller: scrollController,
                            children: List.generate(3, (index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0, right: index == 2 ? 20 : 0),
                                child: GestureDetector(
                                        onTap: (){
                                         model.takeToDoggoPageView();
                                        },
                                  child: AnimatedContainer(
                                    child: Center(
                                      child: Padding(
                                        padding:  EdgeInsets.all(index == 2 ? 5.0 : 30.0),
                                        child: images[index],
                                      )
                                    ),
                                    transform: Matrix4.rotationZ(
                                        scrollDirection ==
                                            ScrollDirection.forward
                                        ? 0.07
                                        : scrollDirection == ScrollDirection.reverse
                                            ? -0.07
                                            : 0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.6),
                                          offset: const Offset(4, 6),
                                          blurRadius: 10,
                                          spreadRadius: 1
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      color: colors[index],
                                    ),
                                    duration: const Duration(milliseconds: 100),
                                    width: MediaQuery.of(context).size.height / 4,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Divider(
                  height: 1,
                  color: CustomTheme.useColorMode(Constants.ice0, Constants.nord0),
                ),
              )
            ],
          ));
        });
  }
}

class MyBehaviour extends ScrollBehavior{

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

