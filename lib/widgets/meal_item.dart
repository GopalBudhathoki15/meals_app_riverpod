import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import 'meal_trait.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => MealDetailsScreen(
              meal: meal,
            ),
          ),
        ),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                // width: double.infinity,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealTrait(
                          iconData: Icons.schedule,
                          label: meal.duration.toString(),
                        ),
                        const SizedBox(width: 8),
                        MealTrait(
                          iconData: Icons.work,
                          label: meal.complexity.name,
                        ),
                        const SizedBox(width: 8),
                        MealTrait(
                          iconData: Icons.attach_money,
                          label: meal.affordability.name,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
