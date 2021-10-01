// import 'package:flutter/material.dart';
// import 'package:groceries_app/models/ingredient.dart';
// import 'package:groceries_app/models/unit.dart';

// class ShoppingListItem {
//   final String id;
//   final int amount;
//   final Unit unit;
//   final String name;
//   bool isChosen;
//   int timesChosen;

//   ShoppingListItem({
//     required this.id,
//     required this.amount,
//     required this.unit,
//     required this.name,
//     this.isChosen = false,
//     this.timesChosen = 0,
//   });
// }

// class ShoppingListProvider with ChangeNotifier {
//   Map<Object, ShoppingListItem> _ingredientsInShoppingList =
//       Map<Object, ShoppingListItem>();

//   Map<Object, ShoppingListItem> get ingredientsInShoppingList {
//     return {..._ingredientsInShoppingList};
//   }

//   void addIngredientToShoppingCart({
//     required Ingredient ingredient,
//   }) {
//     var id = ingredient.createdAt;
//     if (_ingredientsInShoppingList.containsKey(id)) {
//       _ingredientsInShoppingList.update(
//         id,
//         (existingShoppingListItem) => ShoppingListItem(
//             id: existingShoppingListItem.id,
//             name: existingShoppingListItem.name,
//             amount: existingShoppingListItem.amount + ingredient.amount,
//             unit: existingShoppingListItem.unit),
//       );
//     } else {
//       _ingredientsInShoppingList.putIfAbsent(
//         id,
//         () => ShoppingListItem(
//           // TODO One could pass the ingredient into this list item
//           // TODO id is not required
//           id: DateTime.now().toString(),
//           amount: ingredient.amount,
//           unit: ingredient.unit,
//           name: ingredient.name,
//         ),
//       );
//     }
//     notifyListeners();
//   }

//   void deleteIngredientFromShoppingCart({
//     required Ingredient ingredient,
//   }) {
//     var id = ingredient.createdAt;

//     if (_ingredientsInShoppingList.containsKey(id)) {
//       _ingredientsInShoppingList.update(
//         id,
//         (existingShoppingListItem) => ShoppingListItem(
//             id: existingShoppingListItem.id,
//             name: existingShoppingListItem.name,
//             amount: existingShoppingListItem.amount - ingredient.amount,
//             unit: existingShoppingListItem.unit),
//       );
//       if (_ingredientsInShoppingList[id]!.amount <= 0) {
//         _ingredientsInShoppingList.remove(id);
//       }
//       notifyListeners();
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';

class ShoppingListProvider with ChangeNotifier {
  Map<Object, Ingredient> _ingredientsInShoppingList =
      Map<Object, Ingredient>();

  Map<Object, Ingredient> get ingredientsInShoppingList {
    return {..._ingredientsInShoppingList};
  }

  var firebaseInstance = FirebaseFirestore.instance.collection('recipes');

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
