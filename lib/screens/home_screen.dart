import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/widgets/featured_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.015,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Column with icon + text, aligned left
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.wb_sunny_outlined,
                            size: screenWidth * 0.06,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            'Good Morning',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        'Alena Sabyan',
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: screenWidth * 0.07,
                    color: AppColors.black,
                  ),
                ],
              ),
            ),

            // Featured Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Text(
                'Featured',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Horizontally Scrollable Cards
            SizedBox(
              height:
                  screenHeight * 0.24, // Adjusted for responsive card height
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: Row(
                  children: const [
                    FeaturedCard(),
                    SizedBox(width: 10),
                    FeaturedCard(),
                    SizedBox(width: 10),
                    FeaturedCard(),
                    SizedBox(width: 10),
                    FeaturedCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
