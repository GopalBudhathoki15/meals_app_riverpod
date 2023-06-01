import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

import '../models/meal.dart';

final isFavoriteProvider = StateProvider.family<bool, Meal>((ref, Meal meal) {
  final favoriteMeals = ref.watch(favoriteMealProvider);
  if (favoriteMeals.contains(meal)) {
    return true;
  }
  return false;
});
