import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastybite/core/app_colors.dart';

class AppTextStyles {
  /// Custom reusable Poppins text style
  static TextStyle poppins({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.black,
    double? height,
    double? letterSpacing,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
