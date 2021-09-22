import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';

class EditIngredientScreen extends StatelessWidget {
  static const routeName = '/edit-ingredient-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ingredient'),
      ),
      body: EditIngredient(),
    );
  }
}
