import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/core/app_text_styles.dart';
import 'package:tastybite/screens/incredient_controller.dart';

class IngredientCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const IngredientCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ingredientController = Get.find<IngredientController>();

    return Container(
      margin: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: screenWidth * 0.025,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35627B).withOpacity(0.1),
            blurRadius: screenWidth * 0.02,
            offset: Offset(0, screenWidth * 0.01),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          Container(
            width: screenWidth * 0.17,
            height: screenWidth * 0.17,
            decoration: BoxDecoration(
              color: const Color(0xFFE6EBF2),
              borderRadius: BorderRadius.circular(screenWidth * 0.03),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(screenWidth * 0.06),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),

          SizedBox(width: screenWidth * 0.03),

          // Title
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.poppins(
                color: AppColors.black,
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Counter with GetX
          Obx(() {
            final quantity = ingredientController.getQuantity(title);
            final isMinimum = ingredientController.isAtMinimum(title);

            return Row(
              children: [
                GestureDetector(
                  onTap: () => ingredientController.decreaseQuantity(title),
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.015),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isMinimum ? AppColors.grey : AppColors.primary,
                      ),
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: screenWidth * 0.04,
                      color: isMinimum ? AppColors.grey : AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  '$quantity',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                GestureDetector(
                  onTap: () => ingredientController.increaseQuantity(title),
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.015),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    child: Icon(
                      Icons.add,
                      size: screenWidth * 0.04,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
