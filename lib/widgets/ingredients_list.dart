import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:groceries_app/widgets/recipe_overview.dart';

// TODO rename required
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
    return Column(
      children: [
        RecipeOverview(recipe: widget.recipe),
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
            },
          ),
        ),
      ],
    );
  }
}
