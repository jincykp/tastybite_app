import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/screens/bottom_nav_screen.dart';
import 'package:tastybite/widgets/custom_button.dart';
import 'package:tastybite/core/app_text_styles.dart'; // ✅ Import your AppTextStyles

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
              Row(
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
              ),
              SizedBox(height: screenHeight * 0.02),

              // Image grid
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/log_one.png',
                        width: screenWidth * 0.3,
                      ),
                      Image.asset(
                        'assets/images/log_two.png',
                        width: screenWidth * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/log_three.png',
                        width: screenWidth * 0.3,
                      ),
                      Image.asset(
                        'assets/images/log_four.png',
                        width: screenWidth * 0.3,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/log_five.png',
                        width: screenWidth * 0.3,
                      ),
                      Image.asset(
                        'assets/images/log_six.png',
                        width: screenWidth * 0.3,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.08),

              // Heading
              Text(
                'Help your path to health goals with happiness',
                style: AppTextStyles.poppins(
                  fontSize: screenWidth * 0.050,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

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

              SizedBox(height: screenHeight * 0.015),

              // Create account text
              Text(
                'Create New Account',
                style: AppTextStyles.poppins(
                  fontSize: screenWidth * 0.040,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),

              SizedBox(height: screenHeight * 0.025),
            ],
          ),
        ),
      ),
    );
  }
}
