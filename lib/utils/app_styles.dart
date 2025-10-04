import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/utils/app_colors.dart';

class AppStyles {
  static TextStyle whiteBold(double size) {
    return GoogleFonts.cairo(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  static TextStyle goldBold(double size) {
    return GoogleFonts.cairo(
      color: AppColors.goldColor,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  static TextStyle blackBold(double size) {
    return GoogleFonts.cairo(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  static TextStyle blackBoldWith90(double size) {
    return GoogleFonts.cairo(
      color: AppColors.blackColorWithOpacity90,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }

  static TextStyle blackBoldWith70(double size) {
    return GoogleFonts.cairo(
      color: AppColors.blackColorWithOpacity70,
      fontWeight: FontWeight.bold,
      fontSize: size,
    );
  }
}
