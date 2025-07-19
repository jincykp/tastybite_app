import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias, // Ensures the image respects border radius
      child: SizedBox(
        width: 264,
        height: 172,
        child: Image.asset(
          'assets/images/featuredcard.png', // Replace with your asset image path
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
