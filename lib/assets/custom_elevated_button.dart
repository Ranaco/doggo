import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../theme/constants.dart';


class CustomElevatedButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const CustomElevatedButton({Key? key, required this.onTap, this.text = "Continue"}):super(key: key);
  @override
        Widget build(BuildContext context){
            return InkWell(
                onTap: onTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
              color: Constants.red,

              borderRadius: BorderRadius.circular(10),
           ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Text(text,
                        style: const TextStyle(
                        fontSize: 20,
                        color: Constants.ice0
                      ),),
                      Icon( text == "Continue" ? Feather.chevrons_right : Feather.chevron_down, color: Colors.white,)
                    ],
                  )
        ),
            );
    }
}
