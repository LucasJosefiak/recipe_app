import 'package:flutter/material.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/widgets/tile_icon.dart';

import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/tile_unit.dart';

class IngredientInfo extends StatelessWidget {
  final Ingredient ingredient;
  final Recipe recipe;
  const IngredientInfo({
    Key? key,
    required this.recipe,
    required this.ingredient,
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
            ingredient: ingredient,
          ),
        );
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              TileIcon(
                iconData: ingredient.unit.icon,
              ),
              SizedBox(
                width: 24,
              ),
              TileTitle(
                title: ingredient.name,
              ),
              Expanded(child: Container()),
              Text(
                ingredient.amount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              TileUnit(unit: ingredient.unit),
            ],
          ),
        ),
      ),
    );
  }
}
