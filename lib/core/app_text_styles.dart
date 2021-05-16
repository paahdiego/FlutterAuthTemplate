import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle redHero(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.redHero,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle primatyTitle(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.primaryTitle,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle secondaryTitle(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.secondaryTitle,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle texts(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.primaryText,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle whiteText(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: Colors.white,
        fontSize: size,
        fontWeight: fontWeight,
      );
}
