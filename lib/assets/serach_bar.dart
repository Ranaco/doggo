import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:doggo/assets/global_data.dart';
import '../theme/constants.dart';
import '../theme/theme_state.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeState = Provider.of<CustomTheme>(context);

    return Container(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        margin: const EdgeInsets.only(left: 10, right: 10),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: themeState.isDark ? Constants.nord2 : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Feather.search,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: GestureDetector(
                  onTap: () {
                    print("Data");
                  },
                  child: const Icon(
                    Feather.filter,
                    color: Colors.grey,
                  )),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ));
  }
}
