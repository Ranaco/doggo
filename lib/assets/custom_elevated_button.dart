import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../theme/constants.dart';


class CustomElevatedButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool showIcon;
  final MainAxisAlignment mainAxisAlignment;
  final double width;
  const CustomElevatedButton({Key? key, this.mainAxisAlignment = MainAxisAlignment.spaceEvenly, this.width = 200, this.showIcon = true, required this.onTap, this.text = "Continue"}):super(key: key);
  @override
        Widget build(BuildContext context){
            return InkWell(
                onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
              height: 50,
              width: width,
              decoration: BoxDecoration(
              color: Constants.red,

              borderRadius: BorderRadius.circular(10),
           ),
                  child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children:  [
                      Text(text,
                        style: const TextStyle(
                        fontSize: 20,
                        color: Constants.ice0
                      ),),
                      showIcon ? Icon( text == "Continue" ? Feather.chevrons_right : Feather.chevron_down, color: Colors.white,) : const SizedBox(),
                    ],
                  )
        ),
            );
    }
}
