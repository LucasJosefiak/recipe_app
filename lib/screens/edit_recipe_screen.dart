import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/widgets/edit_recipe.dart';

class EditRecipeScreen extends StatelessWidget {
  static const routeName = '/edit-recipe-screen';

  @override
  Widget build(BuildContext context) {
    final loadedRecipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
      ),
      body: EditRecipe(
        recipe: loadedRecipe,
      ),
    );
  }
}
