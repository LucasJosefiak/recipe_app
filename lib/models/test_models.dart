import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';

Ingredient getTestIngredient() {
  return Ingredient(
    identifier: '1',
    unit: Unit(
      name: 'Piece',
      icon: Icons.extension,
    ),
    name: 'Tomato Sauce',
    createdAt: DateTime.now(),
  );
}

IngredientAmount getTestIngredientAmount() {
  final ingredient = getTestIngredient();
  return IngredientAmount(
    amount: 100,
    ingredient: ingredient,
  );
}

Recipe getTestRecipe() {
  final ingredientAmount = getTestIngredientAmount();
  return Recipe(
    identifier: '1',
    title: 'Tomato Lasagna',
    createdAt: DateTime.now(),
    ingredients: {
      ingredientAmount.ingredient.name: ingredientAmount,
    },
  );
}
