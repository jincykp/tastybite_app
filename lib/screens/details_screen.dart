import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/data/dummy_data.dart';
import 'package:tastybite/widgets/custom_button.dart';
import 'package:tastybite/widgets/custom_fav_button.dart';
import 'package:tastybite/widgets/ingrediants_card.dart';
import 'package:tastybite/widgets/nutrition_items.dart';
import 'package:tastybite/widgets/popular_recipe_card.dart';
import 'package:tastybite/widgets/section_header.dart';
import 'package:tastybite/widgets/tab_button.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;
    List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/tortilla_chips.png",
        "title": "Tortilla Chips",
        "quantity": 2,
      },
      {
        "image": "assets/images/red_cabbage.png",
        "title": "Red Cabbage",
        "quantity": 1,
      },
      {"image": "assets/images/peanuts.png", "title": "Peanuts", "quantity": 3},
      {
        "image": "assets/images/onion.png",
        "title": "Red Onions",
        "quantity": 4,
      },
    ];

    void increaseQty(int index) {
      setState(() {
        items[index]["quantity"] += 1;
      });
    }

    void decreaseQty(int index) {
      setState(() {
        if (items[index]["quantity"] > 0) {
          items[index]["quantity"] -= 1;
        }
      });
    }

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

          // DraggableScrollableSheet instead of positioned container
          DraggableScrollableSheet(
            initialChildSize:
                0.58, // Same as (1 - 0.42) from your original positioning
            minChildSize: 0.58,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
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
                child: SingleChildScrollView(
                  controller: scrollController,
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
                          const Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time,
                                color: AppColors.grey,
                                size: screenWidth * 0.045,
                              ),
                              SizedBox(width: 4),
                              Text(
                                '15 Min',
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.poppins(
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey,
                                ),
                              ),
                            ],
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
                                fontSize: screenWidth * 0.043,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: NutritionInfoItem(
                              imagePath: 'assets/images/Carbs.png',
                              label: '65g carbs',
                            ),
                          ),
                          Expanded(
                            child: NutritionInfoItem(
                              imagePath: 'assets/images/Proteins.png',
                              label: '27g proteins',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(
                            child: NutritionInfoItem(
                              imagePath: 'assets/images/Calories.png',
                              label: '120 Kcal',
                            ),
                          ),
                          Expanded(
                            child: NutritionInfoItem(
                              imagePath: 'assets/images/Fats.png',
                              label: '91g fats',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),
                      TabButtons(),
                      SizedBox(height: 10),
                      SectionHeader(
                        title: 'Ingredients',
                        actionText: 'Add All to Cart',
                      ),
                      Text(
                        '${items.length} Item',
                        style: AppTextStyles.poppins(
                          color: AppColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Display all ingredient cards
                      ...items.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, dynamic> item = entry.value;
                        return IngredientCard(
                          imagePath: item['image'],
                          title: item['title'],
                          quantity: item['quantity'],
                          onIncrement: () => increaseQty(index),
                          onDecrement: () => decreaseQty(index),
                        );
                      }).toList(),
                      SizedBox(height: 15),
                      CustomButton(
                        text: 'Add To Cart',
                        onTap: () {},
                        backgroundColor: AppColors.primary,
                      ),
                      SizedBox(height: 15),
                      Divider(),
                      SectionHeader(title: 'Creator'),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage: AssetImage(
                            'assets/images/per_three.jpg',
                          ),
                        ),
                        title: Text(
                          'Natalia Luca',
                          style: AppTextStyles.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,

                            color: AppColors.black,
                          ),
                        ),
                        subtitle: Text(
                          "I'm the author and recipe developer.",
                          style: AppTextStyles.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,

                            color: AppColors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      SectionHeader(
                        title: 'Related Recipes',
                        actionText: 'See All',
                      ),
                      SizedBox(
                        height:
                            160, // Increased height to prevent card overflow
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: popularRecipes.map((recipe) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: PopularRecipeCard(
                                  imagePath: recipe.imagePath,
                                  title: recipe.title,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
