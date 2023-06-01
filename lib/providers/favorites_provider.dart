import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/is_favorite_provider.dart';

import '../models/meal.dart';

final favoriteMealProvider = StateNotifierProvider<FavoriteNotifier, List<Meal>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);

  void showInfoMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void toggleFavoriteMeal(Meal meal, BuildContext context, WidgetRef ref) {
    {
      if (state.contains(meal)) {
        state = state.where((m) => m.id != meal.id).toList();
        showInfoMessage('Meal is remove from your favorite meals.', context);
        return;
      }

      state = [...state, meal];

      showInfoMessage('Meal is Marked as Favorite', context);
    }
  }
}
