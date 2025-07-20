import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/widgets/custom_fav_button.dart';
import 'package:tastybite/widgets/tab_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Background
          Container(
            height: screenHeight,
            width: screenWidth,
            color: AppColors.white,
          ),

          // Main image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/salad.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Top icons (Close & Favorite)
          Positioned(
            top: topPadding + screenHeight * 0.015,
            left: screenWidth * 0.04,
            child: CustomIconButton(
              icon: Icons.close,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: topPadding + screenHeight * 0.015,
            right: screenWidth * 0.04,
            child: CustomIconButton(icon: Icons.favorite_border, onTap: () {}),
          ),

          // Bottom sheet
          Positioned(
            top: screenHeight * 0.42,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.025,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(screenWidth * 0.06),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Healthy Taco Salad',
                        style: AppTextStyles.poppins(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.access_time, color: AppColors.grey),
                      Text(
                        '15 Min',
                        style: AppTextStyles.poppins(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text.rich(
                    TextSpan(
                      text:
                          'This Healthy Taco Salad is the universal delight of taco night ',
                      style: AppTextStyles.poppins(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'View More',
                          style: AppTextStyles.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
