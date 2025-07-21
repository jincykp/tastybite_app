import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tastybite/core/app_colors.dart';

class TabButtons extends StatefulWidget {
  @override
  _TabButtonsState createState() => _TabButtonsState();
}

class _TabButtonsState extends State<TabButtons> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.020,
        vertical: screenWidth * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors.tabButtonColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTabButton(
            context: context,
            text: 'Ingredients',
            index: 0,
            isSelected: selectedIndex == 0,
          ),
          _buildTabButton(
            context: context,
            text: 'Instructions',
            index: 1,
            isSelected: selectedIndex == 1,
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
    required String text,
    required int index,
    required bool isSelected,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.035),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.greenButton : Colors.transparent,
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
          ),
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: isSelected ? AppColors.white : AppColors.greenButton,
              fontSize: screenWidth * 0.04,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
