import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';

class ShoppingListProvider with ChangeNotifier {
  Map<Object, Ingredient> _ingredientsInShoppingList =
      Map<Object, Ingredient>();

  Map<Object, Ingredient> get ingredientsInShoppingList {
    return {..._ingredientsInShoppingList};
  }
}
