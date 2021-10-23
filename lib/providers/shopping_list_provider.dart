import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';

class ShoppingListProvider with ChangeNotifier {
  final ShoppingListRepository shoppingListRepository;
  Map<Ingredient, int> ingredients = Map();

  ShoppingListProvider({
    required this.shoppingListRepository,
  });

  void load() {
    shoppingListRepository.getStreamOfItems().forEach((elements) {
      ingredients = Map<Ingredient, int>.fromIterable(
        elements,
        key: (k) => k.ingredient,
        value: (v) => v.amount,
      );
      notifyListeners();
    });
  }

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

      shoppingListRepository.addItem(ingredientAmount);
    }

    ingredients[ingredientAmount.ingredient] =
        ingredients[ingredientAmount.ingredient]! + ingredientAmount.amount;

    shoppingListRepository.updateItem(
      ingredientAmount.copyWith(
        amount: ingredients[ingredientAmount.ingredient],
      ),
    );
  }

  void removeIngredient(Ingredient ingredient) {
    ingredients.remove(ingredient);
  }

  void clearCart() {
    ingredients = Map();
    shoppingListRepository.deleteAll();
    notifyListeners();
  }
}
