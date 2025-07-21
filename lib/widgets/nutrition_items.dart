import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NutritionInfoItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color backgroundColor;

  const NutritionInfoItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.backgroundColor = AppColors.tabButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerSize = size.width * 0.1;

    return Row(
      children: [
        Container(
          width: containerSize,
          height: containerSize,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(containerSize * 0.3),
          ),
          child: Padding(
            padding: EdgeInsets.all(containerSize * 0.15),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
        SizedBox(width: size.width * 0.02),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: size.width * 0.038,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
