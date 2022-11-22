import 'package:flutter/material.dart';

import 'app_colors.dart';

enum AppFonts {
  caption12,
  caption16,
  caption16Bold,
  caption18,
  caption20,
  caption20Bold,
  headline24W900,
  headline24Bold,
}

extension AppFontsExtension on AppFonts {
  TextStyle get getFont {
    switch (this) {
      case AppFonts.caption12:
        return const TextStyle(
          fontSize: 12,
        );
      case AppFonts.caption16:
        return TextStyle(
          fontSize: 16,
          color: AppColors.white.getColor,
        );
      case AppFonts.caption18:
        return TextStyle(
          fontSize: 18,
          color: AppColors.white.getColor,
        );
      case AppFonts.caption20:
        return const TextStyle(
          fontSize: 20,
        );
      case AppFonts.caption16Bold:
        return TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.white.getColor,
        );
      case AppFonts.caption20Bold:
        return TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.white.getColor,
        );
      case AppFonts.headline24W900:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        );
      case AppFonts.headline24Bold:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        );
    }
  }
}
