import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';

class AddIngredientScreen extends StatelessWidget {
  static const routeName = '/add-ingredient-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ingredient'),
      ),
      body: AddIngredient(),
    );
  }
}
