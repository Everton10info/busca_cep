import 'package:flutter/material.dart';

const primaryColor = MaterialColor(
  0xFFBF3030,
  <int, Color>{
    50: Color(0xFFfdebee),
    100: Color(0xFFfbced3),
    200: Color(0xFFea9b9d),
    300: Color(0xFFdf7577),
    400: Color(0xFFe85756),
    500: Color(0xFFed483f),
    600: Color(0xFFde3f3d),
    700: Color(0xFFcc3637),
    800: Color(0xFFBF3030),
    900: Color(0xFFaf2725),
  },
);

enum AppColors {
  black,
  green,
  grey,
  red,
  white,
}

extension AppColorsExtension on AppColors {
  Color get getColor {
    switch (this) {
      case AppColors.green:
        return const Color(0xff57AA73);
      case AppColors.grey:
        return const Color(0xffCCCCCC);
      case AppColors.red:
        return const Color(0xffFD7171);
      case AppColors.white:
        return const Color(0xffffffff);
      default:
        return const Color(0xff000000);
    }
  }
}
