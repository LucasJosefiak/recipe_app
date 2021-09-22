import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/screens/edit_recipe_screen.dart';
import 'package:groceries_app/widgets/ingredients_list.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const routeName = '/recipe-details-screen';

  @override
  Widget build(BuildContext context) {
    final loadedRecipe = ModalRoute.of(context).settings.arguments as Recipe;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedRecipe.title,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  EditRecipeScreen.routeName,
                  arguments: loadedRecipe,
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddIngredientScreen.routeName,
            arguments: loadedRecipe,
          );
        },
      ),
      body: IngredientsList(),
    );
  }
}
