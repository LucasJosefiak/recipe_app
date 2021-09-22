import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/shopping_list.dart';

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shopping-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ShoppingList(),
    );
  }
}
