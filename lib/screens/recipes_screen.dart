import 'package:flutter/material.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/widgets/recipes_list.dart';

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => AddRecipeScreen(),
            ),
          );
        },
        label: Text(
          'Add',
        ),
        icon: Icon(
          Icons.add,
        ),
      ),
      body: RecipesList(),
    );
  }
}
