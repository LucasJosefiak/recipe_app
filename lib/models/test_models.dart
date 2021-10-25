import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';

Recipe getTestRecipe() {
  return Recipe(
    identifier: '1',
    title: 'Tomato Lasagna',
    createdAt: DateTime.now(),
    ingredients: {
      'tomato sauce': IngredientAmount(
        ingredient: Ingredient(
          identifier: '1',
          unit: Unit(
            name: 'Piece',
            icon: Icons.extension,
          ),
          name: 'Tomato Sauce',
          createdAt: DateTime.now(),
        ),
        amount: 100,
      ),
    },
  );
}
