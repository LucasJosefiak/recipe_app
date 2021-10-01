import 'package:flutter/material.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/widgets/recipes_list.dart';

class RecipesScreen extends StatelessWidget {
  static const routeName = '/recipes-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: RecipesList(),
    );
  }
}
