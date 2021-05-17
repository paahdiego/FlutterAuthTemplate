import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle inputStyle(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.kPrimaryColor,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle textButtonStyle(
    double size, {
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.kPrimaryColor,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle roundedButtonStyle(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.white,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle body(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.black,
        fontSize: size,
        fontWeight: fontWeight,
      );
  static TextStyle title(
    double size, {
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.kPrimaryColor,
        fontSize: size,
        fontWeight: fontWeight,
      );
}
