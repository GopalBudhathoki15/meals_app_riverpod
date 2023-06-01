import 'package:flutter/material.dart';
// import 'package:meals_app/screens/tab_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';

enum Filter {
  gultenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  final Map<Filter, bool> currentFilters;
  const FilterScreen({
    super.key,
    required this.currentFilters,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _setGulteenFree = false;
  bool _setLactoseFree = false;
  bool _setVegetarian = false;
  bool _setVegan = false;

  @override
  void initState() {
    super.initState();
    _setGulteenFree = widget.currentFilters[Filter.gultenFree]!;
    _setLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _setVegetarian = widget.currentFilters[Filter.vegetarian]!;
    _setVegan = widget.currentFilters[Filter.vegan]!;
  }
  // void _selectScreen(String identifier) {
  //   Navigator.of(context).pop();
  //   if (identifier == 'filter-screen') {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(builder: (ctx) => const FilterScreen()),
  //     );
  //   } else {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(builder: (ctx) => const TabScreen()),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter"),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: _selectScreen,
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.gultenFree: _setGulteenFree,
            Filter.lactoseFree: _setLactoseFree,
            Filter.vegetarian: _setVegetarian,
            Filter.vegan: _setVegan,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gulteen-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Contains Gulteen free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
              value: _setGulteenFree,
              onChanged: (value) => setState(() {
                _setGulteenFree = value;
              }),
            ),
            SwitchListTile(
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Contains Lactose free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
              value: _setLactoseFree,
              onChanged: (value) => setState(() {
                _setLactoseFree = value;
              }),
            ),
            SwitchListTile(
              title: Text(
                'Vegeterain',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Contains Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
              value: _setVegetarian,
              onChanged: (value) => setState(() {
                _setVegetarian = value;
              }),
            ),
            SwitchListTile(
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Contains Vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.secondary,
              contentPadding: const EdgeInsets.only(right: 22, left: 34),
              value: _setVegan,
              onChanged: (value) => setState(() {
                _setVegan = value;
              }),
            ),
          ],
        ),
      ),
    );
  }
}
