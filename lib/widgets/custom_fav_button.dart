import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;
  final double padding;
  final VoidCallback? onTap;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.size = 20,
    this.iconColor = AppColors.black,
    this.backgroundColor = AppColors.white,
    this.padding = 6,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: size, color: iconColor),
      ),
    );
  }
}
