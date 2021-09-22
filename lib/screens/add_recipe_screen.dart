import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/add_recipe.dart';

class AddRecipeScreen extends StatelessWidget {
  static const routeName = '/add-recipe-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Recipe'),
      ),
      body: AddRecipe(),
    );
  }
}
