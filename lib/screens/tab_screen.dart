import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';

const Map<Filter, bool> kInitilFilter = {
  Filter.gultenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  String title = '';
  int _selectedPageIndex = 0;
  List<Meal> favoriteMeals = [];
  Map<Filter, bool> _selectedFilter = kInitilFilter;

  void _selectScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filter-screen') {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => FilterScreen(
                    currentFilters: _selectedFilter,
                  )));

      setState(() {
        _selectedFilter = result ?? kInitilFilter;
      });
    }
  }

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // void toggleMeal(Meal meal) {
  //   setState(() {
  //     if (favoriteMeals.contains(meal)) {
  //       favoriteMeals.remove(meal);
  //       ref.read(isFavoriteProvider.notifier).state = false;
  //       showInfoMessage('Meal is remove from your favorite meals.');
  //       return;
  //     }
  //     favoriteMeals.add(meal);
  //     ref.read(isFavoriteProvider.notifier).state = true;
  //     showInfoMessage('Meal is Marked as Favorite');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where(
      (meal) {
        if (_selectedFilter[Filter.gultenFree]! && !meal.isGlutenFree) {
          return false;
        }
        if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
          return false;
        }
        if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
          return false;
        }
        if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
          return false;
        }
        return true;
      },
    ).toList();
    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activeScreen = Consumer(
        builder: (context, ref, _) => MealsScreen(
          meal: ref.watch(favoriteMealProvider),
        ),
      );
      activePageTitle = 'Favorite Meals';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
        leading: Builder(
          builder: (ctx) => IconButton(
            onPressed: () {
              Scaffold.of(ctx).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      body: activeScreen,
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (int index) {
          selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
