import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import '../models/meal.dart';
import '../widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Meal> availableMeals;
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
    // required this.setTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: [
        for (var category in availableCategories)
          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    category.color.withOpacity(0.55),
                    category.color.withOpacity(0.9),
                  ],
                ),
              ),
              child: CategoryCard(
                category: category,
                availableMeals: availableMeals,
              ),
            ),
          )
      ],
    );
  }
}
