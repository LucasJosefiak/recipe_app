import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';

class ShoppingListProvider with ChangeNotifier {
  Map<Ingredient, int> ingredients = Map();

  void addRecipe(Recipe recipe) {
    for (final ingredient in recipe.ingredients.values) {
      _addIngredient(ingredient);
    }
    notifyListeners();
  }

  void _addIngredient(IngredientAmount ingredientAmount) {
    if (!ingredients.containsKey(ingredientAmount)) {
      ingredients.putIfAbsent(
        ingredientAmount.ingredient,
        () => 0,
      );
    }

    ingredients[ingredientAmount.ingredient] =
        ingredients[ingredientAmount.ingredient]! + ingredientAmount.amount;
  }

  void removeIngredient(Ingredient ingredient) {
    ingredients.remove(ingredient);
  }

  void clearCart() {
    ingredients = Map();
    notifyListeners();
  }
}
