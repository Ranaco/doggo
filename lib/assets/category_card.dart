import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/constants.dart';
import '../theme/theme_state.dart';

class CategoryCard extends StatelessWidget{

  final String taskName;
  final String id;
  final VoidCallback onTap;


  const CategoryCard({Key? key, required this.taskName, required this.onTap, this.id = "1"}):super(key: key);

  @override
  Widget build(BuildContext context){

    var themeState = Provider.of<CustomTheme>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 180,
          height: 205,
          decoration: BoxDecoration(
            boxShadow: [
              !themeState.isDark ? BoxShadow(
                  offset: const Offset(-2, -2),
                  color: Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 2
              ) : const BoxShadow(),
              BoxShadow(
                  offset: const Offset(5, 5),
                  color: CustomTheme.useColorMode(Colors.grey.shade900, Colors.grey.shade400),
                  blurRadius: 10,
                  spreadRadius: 2
              ),
            ],
            color: CustomTheme.useColorMode(Constants.nord2, Constants.face),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text(taskName),)
      ),
    );
  }
}