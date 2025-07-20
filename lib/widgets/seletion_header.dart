import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText; // now nullable
  final VoidCallback? onActionTap;
  final double? fontSize;

  const SectionHeader({
    super.key,
    required this.title,
    this.actionText, // null = no right-side text shown
    this.onActionTap,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.poppins(
            fontSize: fontSize ?? screenWidth * 0.045,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        if (actionText != null)
          GestureDetector(
            onTap: onActionTap,
            child: Text(
              actionText!,
              style: AppTextStyles.poppins(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}
