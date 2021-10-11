import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/widgets/buttons/custom_icon_button.dart';
import 'package:provider/src/provider.dart';

import 'custom_card.dart';

class RecipeInfo extends StatelessWidget {
  final Recipe recipe;
  const RecipeInfo({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RecipeDetailsScreen.routeName,
            arguments: recipe);
      },
      child: CustomCard(
        child: Row(
          children: [
            Expanded(
              child: Text(
                recipe.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            CustomIconButton(
              function: () {
                var recipesProvider = context.read<RecipesProvider>();
                //context.read<T>() returns T without listening to it
                recipesProvider.deleteRecipe(recipe);
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
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
