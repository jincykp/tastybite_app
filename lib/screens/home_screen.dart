import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/widgets/featured_card.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/widgets/food_card.dart';
import 'package:tastybite/widgets/seletion_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    String selectedCategory = 'Breakfast';

    // Consistent padding value for all content
    final contentPadding = EdgeInsets.symmetric(horizontal: screenWidth * 0.04);

    final List<String> categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];
    final List<Map<String, String>> foodItems = [
      {
        'image': 'assets/images/fc_one.png',
        'title': 'Healthy Taco Salad with fresh vegetable',
        'kcal': '120 Kcal',
        'time': '20 Hours',
      },
      {
        'image': 'assets/images/burgur.png',
        'title': 'Japanese-style Pancakes Recipe',
        'kcal': '150 Kcal',
        'time': '30 Min',
      },
      {
        'image': 'assets/images/fc_one.png',
        'title': 'Avocado Toast with boiled eggs',
        'kcal': '200 Kcal',
        'time': '15 Min',
      },
    ];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Padding(
                padding: contentPadding.copyWith(
                  top: screenHeight * 0.015,
                  bottom: screenHeight * 0.015,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              style: AppTextStyles.poppins(
                                fontSize: screenWidth * 0.030,
                                fontWeight: FontWeight.w300,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'Alena Sabyan',
                          style: AppTextStyles.poppins(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
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
                padding: contentPadding,
                child: SectionHeader(title: 'Featured'),
              ),

              // Horizontally Scrollable Cards
              SizedBox(
                height: screenHeight * 0.24,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: contentPadding,
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

              // Category Title
              Padding(
                padding: contentPadding,
                child: SectionHeader(
                  title: 'Category',
                  actionText: 'See All',
                  onActionTap: () {},
                ),
              ),
              SizedBox(height: 10),
              // Category Selection
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: contentPadding,
                  child: Row(
                    children: categories.map((category) {
                      final isSelected = selectedCategory == category;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF70B9BE)
                                  : const Color(0xFFF1F5F5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              category,
                              style: AppTextStyles.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Popular Recipes Title
              Padding(
                padding: contentPadding,
                child: SectionHeader(
                  title: 'Popular Recipes',
                  actionText: 'See All',
                  onActionTap: () {
                    // your navigation or action here
                  },
                ),
              ),
              SizedBox(height: 10),
              // Popular Recipes List
              SizedBox(
                height: 240,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodItems.length,
                  padding: contentPadding,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final item = foodItems[index];
                    return FoodCard(
                      imagePath: item['image']!,
                      title: item['title']!,
                      kcal: item['kcal']!,
                      time: item['time']!,
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
