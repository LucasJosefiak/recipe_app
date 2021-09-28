import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:provider/provider.dart';

class RecipeListTile extends StatelessWidget {
  final Recipe recipe;

  const RecipeListTile({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(recipe.title),
      leading: IconButton(
        icon: Icon(Icons.list),
        onPressed: () {
          Navigator.pushNamed(
            context,
            RecipeDetailsScreen.routeName,
            arguments: recipe,
          );
        },
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
        ),
        onPressed: () {
          var recipesProvider = context.read<RecipesProvider>();
          //TODO what does "read" do?

          recipesProvider.deleteRecipe(recipe.id!);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Recipe was deleted!'),
              duration: Duration(seconds: 3),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  recipesProvider.undoDelete();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
