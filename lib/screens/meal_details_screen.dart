import 'package:flutter/material.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/is_favorite_provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/meal.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toggleFavoriteMeal = ref.watch(favoriteMealProvider.notifier);
    final isFavorite = ref.watch(isFavoriteProvider(meal));
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          Consumer(builder: (context, r, _) {
            return IconButton(
              icon: isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border),
              onPressed: () {
                toggleFavoriteMeal.toggleFavoriteMeal(meal, context, r);
              },
              
            );
          }),
        ],
      ),
      body: ListView(
        children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Ingredients",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              for (var ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: const TextStyle(color: Colors.white),
                ),
            ],
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Steps",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var step in meal.steps)
                Text(
                  step,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
            ],
          )
        ],
      ),
    );
  }
}
