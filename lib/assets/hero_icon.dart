import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doggo/assets/icons.dart';

class HeroIcons extends StatelessWidget {
  const HeroIcons({
    Key? key,
    required this.icon,
    this.color,
    this.size = 30,
  }) : super(key: key);

  final HeroIcon icon;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/svg/$icon.svg',
      width: size,
      height: size,
      alignment: Alignment.center,
      color: color ?? IconTheme.of(context).color,
    );
  }
}
