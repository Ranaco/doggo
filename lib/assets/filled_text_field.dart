import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:doggo/theme/constants.dart';
import 'package:doggo/theme/theme_state.dart';

class FilledTextField extends StatelessWidget {
  final bool obscureText;
  final Widget? suffix;
  final String hintText;
  final bool pass;
  final Function? onSuffixPressed;
  final String? Function(String?)? validator;
  final bool isTextField;
  final Function(String?) onChanged;
  const FilledTextField(
      {Key? key,
      required this.onChanged,
      this.validator,
      this.onSuffixPressed,
        this.isTextField = true,
      this.suffix,
      required this.obscureText,
      required this.pass,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent));
    return isTextField ? ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          width: 350,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            obscureText: obscureText,
            onChanged: onChanged,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 15, color: Constants.red),
              fillColor: Colors.grey.withOpacity(0.3),
              hintText: hintText,
              filled: true,
              suffixIcon: pass
                  ? GestureDetector(
                      onTap: () {
                        onSuffixPressed!();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: suffix,
                      ),
                    )
                  : null,
              border: border,
              enabledBorder: border,
              errorBorder: border,
              focusedBorder: border,
            ),
            validator: validator,
          ),
        ),
      ),
    ):
    ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          width: 350,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextField(
            obscureText: obscureText,
            onChanged: onChanged,
            maxLines: 6,
            decoration: InputDecoration(
              errorStyle: const TextStyle(fontSize: 15, color: Constants.red),
              fillColor: Colors.grey.withOpacity(0.3),
              hintText: hintText,
              filled: true,
              suffixIcon: pass
                  ? GestureDetector(
                onTap: () {
                  onSuffixPressed!();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: suffix,
                ),
              )
                  : null,
              border: border,
              enabledBorder: border,
              errorBorder: border,
              focusedBorder: border,
            ),
          ),
        ),
      ),
    )
    ;
  }
}
