import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';

class AddIngredientScreen extends StatelessWidget {
  static const routeName = '/add-ingredient-screen';

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ingredient'),
      ),
      body: AddIngredient(
        recipe: recipe,
      ),
    );
  }
}
