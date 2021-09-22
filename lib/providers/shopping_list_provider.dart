import 'package:flutter/material.dart';

class ShoppingListItem {
  final String id;
  final int amount;
  final String unit;
  final String name;
  bool isChosen;
  int timesChosen;

  ShoppingListItem(
      {@required this.id,
      @required this.amount,
      @required this.unit,
      @required this.name,
      this.isChosen = false,
      this.timesChosen = 0});
}

class ShoppingListProvider with ChangeNotifier {
  Map<String, ShoppingListItem> _ingredientsInShoppingList =
      Map<String, ShoppingListItem>();

  Map<String, ShoppingListItem> get ingredientsInShoppingList {
    return {..._ingredientsInShoppingList};
  }

  void addIngredientToShoppingCart({
    String ingredientId,
    int amount,
    String unit,
    String name,
    bool isChosen,
  }) {
    if (_ingredientsInShoppingList.containsKey(ingredientId)) {
      _ingredientsInShoppingList.update(
        ingredientId,
        (existingShoppingListItem) => ShoppingListItem(
            id: existingShoppingListItem.id,
            name: existingShoppingListItem.name,
            amount: existingShoppingListItem.amount + amount,
            unit: existingShoppingListItem.unit),
      );
    } else {
      _ingredientsInShoppingList.putIfAbsent(
        ingredientId,
        () => ShoppingListItem(
          id: DateTime.now().toString(),
          amount: amount,
          unit: unit,
          name: name,
        ),
      );
    }
    notifyListeners();
  }

  void deleteIngredientFromShoppingCart({
    String ingredientId,
    int amount,
    String unit,
    String name,
    bool isChosen,
  }) {
    // if (!_ingredientsInShoppingList.containsKey(ingredientId)) {
    //   return;
    // }
    _ingredientsInShoppingList.update(
      ingredientId,
      (existingShoppingListItem) => ShoppingListItem(
          id: existingShoppingListItem.id,
          name: existingShoppingListItem.name,
          amount: existingShoppingListItem.amount - amount,
          unit: existingShoppingListItem.unit),
    );
    if (_ingredientsInShoppingList[ingredientId].amount <= 0) {
      // _ingredientsInShoppingList.remove(ingredientId);
      _ingredientsInShoppingList.remove(ingredientId);
    }
    notifyListeners();
  }
}
