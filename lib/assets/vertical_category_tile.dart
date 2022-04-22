import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doggo/theme/theme_state.dart';

import '../theme/constants.dart';

class VerticalCategoryTile extends StatelessWidget {
  const VerticalCategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeState = Provider.of<CustomTheme>(context);

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 150,
      decoration: BoxDecoration(
          color: themeState.isDark ? Constants.nord2 : Constants.face,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            !themeState.isDark
                ? BoxShadow(
                    offset: Offset(-2, -2),
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    spreadRadius: 2)
                : BoxShadow(),
            BoxShadow(
                offset: Offset(5, 5),
                color: themeState.isDark
                    ? Colors.grey.shade900
                    : Colors.grey.shade400,
                blurRadius: 10,
                spreadRadius: 2),
          ]),
    );
  }
}
