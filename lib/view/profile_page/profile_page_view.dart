import 'package:doggo/assets/custom_elevated_button.dart';
import 'package:doggo/view/profile_page/profile_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfilePageView extends StatelessWidget{
  const ProfilePageView({ Key? key }):super(key: key);

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<ProfileViewModel>.reactive(viewModelBuilder: () => ProfileViewModel(), builder: (context, model, child){
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
                      child: CustomElevatedButton(
                        onTap: (){
                            model.logOut();
                        },
                        mainAxisAlignment: MainAxisAlignment.center,
                        width: 150,
                        showIcon: false,
                        text: "Log out",
                      ),
                    ),
                  ],
                )
            ]
          )
        );
    });
  }
}