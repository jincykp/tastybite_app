import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top right "Later"
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Later',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Image grid
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/log_one.png'),
                      Image.asset('assets/images/log_two.png'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/log_three.png'),
                      Image.asset('assets/images/log_four.png'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/log_five.png'),
                      Image.asset('assets/images/log_six.png'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 65),

              // Heading
              Text(
                'Help your path to health goals with happiness',
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              // Login button
              CustomButton(text: 'Login', onTap: () {}),

              const SizedBox(height: 10),

              // Create account text
              Text(
                'Create New Account',
                style: TextStyle(
                  //fontFamily: 'SofiaPro',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
