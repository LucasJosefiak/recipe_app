import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/widgets/shopping_list.dart';
import 'package:provider/provider.dart';

class ShoppingListScreen extends StatelessWidget {
  static const routeName = '/shopping-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<ShoppingListProvider>(
            context,
            listen: false,
          ).clearCart();
        },
        label: Text('Clear'),
        icon: Icon(FontAwesomeIcons.cartArrowDown),
      ),
      body: ShoppingList(),
    );
  }
}
