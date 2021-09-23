import 'package:flutter/material.dart';
import 'package:groceries_app/screens/recipes_screen.dart';
import 'package:groceries_app/screens/shopping_list_screen.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': RecipesScreen(),
      },
      {
        'page': ShoppingListScreen(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO This is problematic, because
      // multiple scaffolds are injected into the tree
      // The first scaffold is in this widget.
      // The second scaffold is within _pages.
      // A ButtomNavigationBar must not be used to host screens!
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping List',
          ),
        ],
      ),
    );
  }
}
