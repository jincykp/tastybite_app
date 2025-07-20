import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String kcal;
  final String time;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.kcal,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.18;
    final cardWidth = screenWidth * 0.5;
    final horizontalPadding = screenWidth * 0.035;

    return Container(
      width: cardWidth,
      //  height: screenHeight * 0.30,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with favorite icon
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: screenHeight * 0.015,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    height: imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppColors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              title,
              style: AppTextStyles.poppins(
                fontSize: screenWidth * 0.032,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              maxLines: 2,
            ),
          ),

          SizedBox(height: screenHeight * 0.01),

          // Info Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.local_fire_department_outlined,
                      color: AppColors.grey,
                      size: screenWidth * 0.035,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      kcal,
                      style: AppTextStyles.poppins(
                        fontSize: screenWidth * 0.025,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: screenWidth * 0.015,
                      color: AppColors.grey,
                    ),
                    SizedBox(width: screenWidth * 0.015),
                    Icon(
                      Icons.access_time,
                      size: screenWidth * 0.035,
                      color: AppColors.grey,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      time,
                      style: AppTextStyles.poppins(
                        fontSize: screenWidth * 0.025,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
