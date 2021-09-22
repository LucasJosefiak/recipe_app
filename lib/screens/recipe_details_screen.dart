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
    // TODO its a bit confusing that a recipe is passed here since the recipe
    // might change if the user decides to change the name of the recipe
    // passing the ID and obtaining the recipe via the provider is better
    // since if the recipe is changed the update can be displayed on this screen.
    Recipe loadedRecipe = ModalRoute.of(context).settings.arguments as Recipe;
    loadedRecipe = context
        .watch<RecipesProvider>()
        .recipes
        .firstWhere((Recipe recipe) => recipe.id == loadedRecipe.id);
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
