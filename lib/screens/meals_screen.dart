import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meal;
  final String? title;
  const MealsScreen({
    super.key,
    required this.meal,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meal.isEmpty) {
      content = Center(
        child: Text(
          'Oops no meal availabe',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: meal.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meal[index],
        ),
      );
    }
    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
