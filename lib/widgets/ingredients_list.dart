import 'package:flutter/material.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:provider/provider.dart';

import 'buttons/custom_elevated_button.dart';

class IngredientsList extends StatefulWidget {
  final Recipe recipe;

  const IngredientsList({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ShoppingListProvider>(
      context,
      listen: false,
    );
    final recipesProvider = Provider.of<RecipesProvider>(
      context,
      listen: false,
    );

    return Column(
      children: [
        SizedBox(height: 8),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
              itemCount: widget.recipe.ingredients.length,
              itemBuilder: (context, index) {
                Ingredient ingredient = widget.recipe.ingredients[index];
                return IngredientInfo(
                  recipe: widget.recipe,
                  ingredient: ingredient,
                );
              }),
        ),
        Elevated(
          function: () {
            Navigator.pushNamed(context, AddIngredientScreen.routeName,
                arguments: widget.recipe);
          },
          text: 'Add new ingredient',
        ),
      ],
    );
  }
}
