import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_screen.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryCard extends StatelessWidget {
  final List<Meal> availableMeals;
  const CategoryCard({
    super.key,
    required this.category,
    required this.availableMeals,
  });

  final Category category;

  List<Meal> getMeal(Category category) {
    final List<Meal> meal =
        availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    return meal;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primary,
      onTap: () {
        final meals = getMeal(category);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => MealsScreen(
                    meal: meals,
                    title: category.title,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}
