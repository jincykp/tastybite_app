import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tastybite/screens/favorate_controller.dart';
import 'package:tastybite/screens/incredient_controller.dart';
import 'package:tastybite/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TastyBite',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
      initialBinding: BindingsBuilder(() {
        // Initialize the FavoritesController globally
        Get.put(FavoritesController());
        Get.put(IngredientController());
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}
