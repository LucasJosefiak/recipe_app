import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';

class ShoppingListProvider with ChangeNotifier {
  Map<Object, Ingredient> _ingredientsInShoppingList =
      Map<Object, Ingredient>();

  Map<Object, Ingredient> get ingredientsInShoppingList {
    return {..._ingredientsInShoppingList};
  }

  void addIngredientToShoppingCart({
    required Ingredient ingredient,
  }) {
    var id = ingredient.createdAt;
    if (_ingredientsInShoppingList.containsKey(id)) {
      _ingredientsInShoppingList.update(
        id,
        (existingIngredient) => existingIngredient.copyWith(
          amount: existingIngredient.amount + ingredient.amount,
        ),
      );
    } else {
      _ingredientsInShoppingList.putIfAbsent(
        id,
        () => ingredient.copyWith(
          createdAt: DateTime.now(),
        ),
      );
    }
    notifyListeners();
  }

  void deleteIngredientFromShoppingCart({
    required Ingredient ingredient,
  }) {
    var id = ingredient.createdAt;

    if (_ingredientsInShoppingList.containsKey(id)) {
      _ingredientsInShoppingList.update(
        id,
        (existingIngredient) => existingIngredient.copyWith(
          amount: existingIngredient.amount - ingredient.amount,
        ),
      );
      if (_ingredientsInShoppingList[id]!.amount <= 0) {
        _ingredientsInShoppingList.remove(id);
      }
      notifyListeners();
    }
  }
}
