import 'package:get/get.dart';

class IngredientController extends GetxController {
  // Observable map to store ingredient quantities
  final RxMap<String, int> _quantities = <String, int>{}.obs;

  // Initialize ingredients with default quantities
  void initializeIngredients(List<Map<String, dynamic>> ingredients) {
    for (var ingredient in ingredients) {
      String key = ingredient['title'].toString().toLowerCase().replaceAll(
        ' ',
        '_',
      );
      _quantities[key] = ingredient['quantity'] ?? 1;
    }
  }

  // Get quantity for a specific ingredient
  int getQuantity(String ingredientTitle) {
    String key = ingredientTitle.toLowerCase().replaceAll(' ', '_');
    return _quantities[key] ?? 1;
  }

  // Increase quantity
  void increaseQuantity(String ingredientTitle) {
    String key = ingredientTitle.toLowerCase().replaceAll(' ', '_');
    int currentQty = _quantities[key] ?? 1;
    _quantities[key] = currentQty + 1;
  }

  // Decrease quantity (minimum 1)
  void decreaseQuantity(String ingredientTitle) {
    String key = ingredientTitle.toLowerCase().replaceAll(' ', '_');
    int currentQty = _quantities[key] ?? 1;
    if (currentQty > 1) {
      _quantities[key] = currentQty - 1;
    }
  }

  // Check if quantity is at minimum (1)
  bool isAtMinimum(String ingredientTitle) {
    return getQuantity(ingredientTitle) <= 1;
  }

  // Get total items count
  int getTotalItems() {
    return _quantities.values.fold(0, (sum, qty) => sum + qty);
  }
}
