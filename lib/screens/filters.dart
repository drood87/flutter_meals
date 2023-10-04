import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';



class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    required this.currentFilters,
    super.key,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;
  var _isLactoseFree = false;

  // use initState() to have access to properties from the StatefulWidget class FilterScreen.
  //Otherwise we would not have access to the widget._ property
  @override
  void initState() {
    super.initState();

    _isGlutenFree = widget.currentFilters[Filter.glutenFree]!;
    _isLactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _isVegan = widget.currentFilters[Filter.vegan]!;
    _isVegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: WillPopScope(
        // willPopScope allows us to control the behaviour when the
        // back button is pressed. here with returning false we tell
        // it not to go back but we do it manually with the navigator pop
        // https://api.flutter.dev/flutter/widgets/WillPopScope-class.html
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _isGlutenFree,
            Filter.lactoseFree: _isLactoseFree,
            Filter.vegan: _isVegan,
            Filter.vegetarian: _isVegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isGlutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _isGlutenFree = isChecked;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _isVegan,
              onChanged: (isChecked) {
                setState(() {
                  _isVegan = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _isVegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _isVegetarian = isChecked;
                });
              },
              title: Text(
                'Vegatarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _isLactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _isLactoseFree = isChecked;
                });
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
