import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';

class AccountProfileCard extends StatelessWidget {
  const AccountProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.03,
      ),
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: screenWidth * 0.08,
            backgroundImage: const AssetImage('assets/images/per_four.jpg'),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alena Sabyan',
                  style: AppTextStyles.poppins(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Recipe Developer',
                  style: AppTextStyles.poppins(
                    fontSize: screenWidth * 0.032,
                    color: AppColors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF353535),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
