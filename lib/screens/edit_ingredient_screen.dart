import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';
import 'package:provider/provider.dart';

class EditIngredientScreen extends StatelessWidget {
  static const routeName = '/edit-ingredient-screen';

  @override
  Widget build(BuildContext context) {
    final argument =
        ModalRoute.of(context)!.settings.arguments as EditIngredientArgument;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ingredient'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<RecipesProvider>(
                context,
                listen: false,
              ).removeIngredientFromRecipe(
                recipe: argument.recipe,
                ingredient: argument.ingredientAmount,
              );
              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.trash,
            ),
          )
        ],
      ),
      body: EditIngredient(
        recipe: argument.recipe,
        ingredientAmount: argument.ingredientAmount,
      ),
    );
  }
}
