import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/unit.dart';

class ShoppingListItem {
  final String id;
  final int amount;
  final Unit unit;
  final String name;
  bool isChosen;
  int timesChosen;

  ShoppingListItem({
    required this.id,
    required this.amount,
    required this.unit,
    required this.name,
    this.isChosen = false,
    this.timesChosen = 0,
  });
}

class ShoppingListProvider with ChangeNotifier {
  Map<String, ShoppingListItem> _ingredientsInShoppingList =
      Map<String, ShoppingListItem>();

  Map<String, ShoppingListItem> get ingredientsInShoppingList {
    return {..._ingredientsInShoppingList};
  }

  void addIngredientToShoppingCart({
    required Ingredient ingredient,
  }) {
    var id = ingredient.id!;
    if (_ingredientsInShoppingList.containsKey(id)) {
      _ingredientsInShoppingList.update(
        id,
        (existingShoppingListItem) => ShoppingListItem(
            id: existingShoppingListItem.id,
            name: existingShoppingListItem.name,
            amount: existingShoppingListItem.amount + ingredient.amount,
            unit: existingShoppingListItem.unit),
      );
    } else {
      _ingredientsInShoppingList.putIfAbsent(
        id,
        () => ShoppingListItem(
          // TODO One could pass the ingredient into this list item
          // TODO id is not required
          id: DateTime.now().toString(),
          amount: ingredient.amount,
          unit: ingredient.unit,
          name: ingredient.name,
        ),
      );
    }
    notifyListeners();
  }

  void deleteIngredientFromShoppingCart({
    required Ingredient ingredient,
  }) {
    var id = ingredient.id!;
    _ingredientsInShoppingList.update(
      id,
      (existingShoppingListItem) => ShoppingListItem(
          id: existingShoppingListItem.id,
          name: existingShoppingListItem.name,
          amount: existingShoppingListItem.amount - ingredient.amount,
          unit: existingShoppingListItem.unit),
    );

    if (_ingredientsInShoppingList[id]!.amount <= 0) {
      _ingredientsInShoppingList.remove(id);
    }
    notifyListeners();
  }
}
