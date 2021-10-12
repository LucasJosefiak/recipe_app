import 'package:flutter/material.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/widgets/tile.dart';
import 'package:groceries_app/widgets/tile_icon.dart';

import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/tile_unit.dart';

class IngredientAmountInfo extends StatelessWidget {
  final IngredientAmount ingredientAmount;
  final Recipe recipe;
  const IngredientAmountInfo({
    Key? key,
    required this.recipe,
    required this.ingredientAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EditIngredientScreen.routeName,
          arguments: EditIngredientArgument(
            recipe: recipe,
            ingredientAmount: ingredientAmount,
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Tile(
                iconData: ingredientAmount.ingredient.unit.icon,
                title: ingredientAmount.ingredient.name,
              ),
              Expanded(child: Container()),
              Text(
                ingredientAmount.amount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              TileUnit(
                unit: ingredientAmount.ingredient.unit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
