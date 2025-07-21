import 'package:flutter/material.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/widgets/account_profile_card.dart';
import 'package:tastybite/widgets/custom_fav_button.dart';
import 'package:tastybite/widgets/my_favorates_card.dart';
import 'package:tastybite/widgets/section_header.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = [
      {
        'imagePath': 'assets/images/scard_one.png',
        'title': 'Sunny Egg & Toast Avocado',
        'avatarPath': 'assets/images/per_four.jpg',
        'authorName': 'Alice Fala',
      },
      {
        'imagePath': 'assets/images/scard_two.png',
        'title': 'Spicy Chicken Bowl',
        'avatarPath': 'assets/images/per_three.jpg',
        'authorName': 'John Lee',
      },
      {
        'imagePath': 'assets/images/scard_one.png',
        'title': 'Sunny Egg & Toast Avocado',
        'avatarPath': 'assets/images/per_four.jpg',
        'authorName': 'Alice Fala',
      },
      {
        'imagePath': 'assets/images/scard_two.png',
        'title': 'Spicy Chicken Bowl',
        'avatarPath': 'assets/images/per_three.jpg',
        'authorName': 'John Lee',
      },
      // Add more items if needed
    ];

    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Responsive padding values
    final horizontalPadding = screenWidth * 0.05; // 5% of width
    final topSpacing = screenHeight * 0.02; // 2% of height

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: topSpacing),
              Row(
                children: [
                  Text(
                    'Account',
                    style: AppTextStyles.poppins(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.settings_outlined, size: 25),
                ],
              ),
              AccountProfileCard(),
              const SizedBox(height: 15),
              SectionHeader(title: 'My Favorites', actionText: 'See All'),
              const SizedBox(height: 8),
              SizedBox(
                height: 400, // Adjust height as needed
                child: GridView.builder(
                  itemCount: favorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final fav = favorites[index];
                    return MyFavoriteCard(
                      imagePath: fav['imagePath']!,
                      title: fav['title']!,
                      avatarPath: fav['avatarPath']!,
                      authorName: fav['authorName']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
