import 'package:flutter/material.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';

class EditIngredientScreen extends StatelessWidget {
  static const routeName = '/edit-ingredient-screen';

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as EditIngredientArgument;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ingredient'),
      ),
      body: EditIngredient(
        recipe: argument.recipe,
        ingredient: argument.ingredient,
      ),
    );
  }
}
