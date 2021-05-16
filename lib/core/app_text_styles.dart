import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static TextStyle primary(
    double size, {
    FontWeight fontWeight = FontWeight.w400,
  }) =>
      GoogleFonts.roboto(
        color: AppColors.kPrimaryColor,
        fontSize: size,
        fontWeight: fontWeight,
      );
}
