import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:meals/models/meal.dart";

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toogleMealFavouriteStatus(Meal meal) {
    // edit of list is prohibited
    final mealIsFavourite = state.contains(meal); // state is list
    if (mealIsFavourite) {
      state = state.where((meal1) => meal1.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
        (ref) => FavouriteMealsNotifier());
