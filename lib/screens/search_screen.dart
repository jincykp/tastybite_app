import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/data/dummy_data.dart';
import 'package:tastybite/widgets/editors_choice_card.dart';
import 'package:tastybite/widgets/popular_recipe_card.dart';
import 'package:tastybite/widgets/section_header.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String selectedCategory = 'Breakfast';
  final List<String> categories = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final double paddingHorizontal = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: AppTextStyles.poppins(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.015),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.black,
                    size: 28,
                  ),
                  hintText: "Search",
                  hintStyle: AppTextStyles.poppins(
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 94, 98, 104),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
              SizedBox(height: screenHeight * 0.025),
              SectionHeader(
                title: 'Popular Recipes',
                actionText: 'View All',
                onActionTap: () {},
              ),
              SizedBox(height: screenHeight * 0.015),
              // Horizontal scrollable recipe cards
              SizedBox(
                height: 160, // Increased height to prevent card overflow
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
              SizedBox(height: screenHeight * 0.015),
              SectionHeader(
                title: 'Editor’s Choice',
                actionText: 'View All',
                onActionTap: () {},
              ),

              EditorsChoiceCard(
                imagePath: 'assets/images/burgur.png',
                title: 'Easy homemade beef burger',
                author: 'James Spader',
                authorAvatarPath: 'assets/images/per_two.jpg',
                onTap: () {},
                margin: EdgeInsets.symmetric(vertical: 8),
              ),
              EditorsChoiceCard(
                imagePath: 'assets/images/blubery.png',
                title: 'Blueberry with egg for breakfast',
                author: 'Alice Fala',
                authorAvatarPath: 'assets/images/per_one.jpg',
                onTap: () {},
                margin: EdgeInsets.symmetric(vertical: 8),
              ),
              EditorsChoiceCard(
                imagePath: 'assets/images/burgur.png',
                title: 'Creamy Garlic Pasta',
                author: 'Jackson Miller',
                authorAvatarPath: 'assets/images/per_two.jpg',
                onTap: () {},
                margin: EdgeInsets.symmetric(vertical: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
