import 'package:get/get.dart';

class FavoritesController extends GetxController {
  // Observable set to store favorite item IDs
  final RxSet<String> _favorites = <String>{}.obs;

  // Getter to access favorites
  Set<String> get favorites => _favorites.value;

  // Check if an item is favorite
  bool isFavorite(String itemId) {
    return _favorites.contains(itemId);
  }

  // Toggle favorite status
  void toggleFavorite(String itemId) {
    if (_favorites.contains(itemId)) {
      _favorites.remove(itemId);
    } else {
      _favorites.add(itemId);
    }
  }

  // Add to favorites
  void addToFavorites(String itemId) {
    _favorites.add(itemId);
  }

  // Remove from favorites
  void removeFromFavorites(String itemId) {
    _favorites.remove(itemId);
  }
}
