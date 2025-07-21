import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/screens/bottom_nav_screen.dart';
import 'package:tastybite/widgets/custom_button.dart';
import 'package:tastybite/core/app_text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              // Top right "Later"
              _buildTopSection(),

              SizedBox(height: screenHeight * 0.02),

              // Image grid section
              _buildImageGrid(screenWidth, screenHeight),

              SizedBox(height: screenHeight * 0.06), // Controlled spacing
              // Heading section
              _buildHeadingSection(screenWidth),

              SizedBox(height: screenHeight * 0.08), // Controlled spacing
              // Bottom section with buttons
              _buildBottomSection(context, screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Later',
          style: AppTextStyles.poppins(
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildImageGrid(double screenWidth, double screenHeight) {
    return Column(
      children: [
        _buildImageRow([
          'assets/images/log_one.png',
          'assets/images/log_two.png',
        ], screenWidth),

        SizedBox(height: screenHeight * 0.015),

        _buildImageRow([
          'assets/images/log_three.png',
          'assets/images/log_four.png',
        ], screenWidth),

        SizedBox(height: screenHeight * 0.015),

        _buildImageRow([
          'assets/images/log_five.png',
          'assets/images/log_six.png',
        ], screenWidth),
      ],
    );
  }

  Widget _buildImageRow(List<String> imagePaths, double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: imagePaths
          .map((imagePath) => Image.asset(imagePath, width: screenWidth * 0.3))
          .toList(),
    );
  }

  Widget _buildHeadingSection(double screenWidth) {
    return Text(
      'Help your path to health goals with happiness',
      style: AppTextStyles.poppins(
        fontSize: screenWidth * 0.050,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBottomSection(
    BuildContext context,
    double screenWidth,
    double screenHeight,
  ) {
    return Column(
      children: [
        // Login button
        CustomButton(
          text: 'Login',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNavScreen()),
            );
          },
        ),

        SizedBox(height: screenHeight * 0.02), // Reduced spacing
        // Create account text
        GestureDetector(
          onTap: () {
            // Add navigation to create account screen
            // Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
          },
          child: Text(
            'Create New Account',
            style: AppTextStyles.poppins(
              fontSize: screenWidth * 0.040,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ),

        SizedBox(height: screenHeight * 0.025),
      ],
    );
  }
}
