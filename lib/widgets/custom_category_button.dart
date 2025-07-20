import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';

class CustomCategoryButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCategoryButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.primary
            : AppColors.categoryButton,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        label,
        style: AppTextStyles.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,

          color: isSelected ? AppColors.white : AppColors.black,
        ),
      ),
    );
  }
}
