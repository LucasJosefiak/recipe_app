import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesProvider with ChangeNotifier {
  List<Recipe> _recipes = [
    //   Recipe(
    //     id: 'r1',
    //     title: 'Thunfischnudeln',
    //     ingredients: [
    //       Ingredient(
    //         id: 'i1',
    //         amount: 500,
    //         unit: Unit.g,
    //         name: 'Vollkornnudeln',
    //       ),
    //       Ingredient(
    //         id: 'i2',
    //         amount: 1,
    //         unit: Unit.can,
    //         name: 'Thunfisch',
    //       ),
    //       Ingredient(
    //         id: 'i3',
    //         amount: 500,
    //         unit: Unit.ml,
    //         name: 'Passierte Tomaten',
    //       ),
    //       Ingredient(
    //         id: 'i4',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Zwiebel',
    //       ),
    //       Ingredient(
    //         id: 'i5',
    //         amount: 2,
    //         unit: Unit.piece,
    //         name: 'Knoblauch',
    //       ),
    //     ],
    //   ),
    //   Recipe(
    //     id: 'r2',
    //     title: 'Erbsennudeln mit Tomatensauce',
    //     ingredients: [
    //       Ingredient(
    //         id: 'i4',
    //         amount: 500,
    //         unit: Unit.g,
    //         name: 'Erbsennudeln',
    //       ),
    //       Ingredient(
    //         id: 'i5',
    //         amount: 4,
    //         unit: Unit.can,
    //         name: 'Geschälte Tomaten',
    //       ),
    //       Ingredient(
    //         id: 'i6',
    //         amount: 2,
    //         unit: Unit.piece,
    //         name: 'Knoblauchzehen',
    //       ),
    //     ],
    //   ),
    //   Recipe(
    //     id: 'r3',
    //     title: 'Curry',
    //     ingredients: [
    //       Ingredient(
    //         id: 'i7',
    //         amount: 500,
    //         unit: Unit.g,
    //         name: 'Reis',
    //       ),
    //       Ingredient(
    //         id: 'i8',
    //         amount: 2,
    //         unit: Unit.can,
    //         name: 'Kichererbsen',
    //       ),
    //       Ingredient(
    //         id: 'i9',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Paprika',
    //       ),
    //       Ingredient(
    //         id: 'i10',
    //         amount: 1,
    //         unit: Unit.glass,
    //         name: 'Currypaste',
    //       ),
    //       Ingredient(
    //         id: 'i11',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Zucchini',
    //       ),
    //       Ingredient(
    //         id: 'i4',
    //         amount: 2,
    //         unit: Unit.piece,
    //         name: 'Zwiebel',
    //       ),
    //       Ingredient(
    //         id: 'i5',
    //         amount: 2,
    //         unit: Unit.piece,
    //         name: 'Knoblauch',
    //       ),
    //     ],
    //   ),
    //   Recipe(
    //     id: 'r4',
    //     title: 'Frühstück',
    //     ingredients: [
    //       Ingredient(
    //         id: 'i12',
    //         amount: 1000,
    //         unit: Unit.g,
    //         name: 'Joghurt',
    //       ),
    //       Ingredient(
    //         id: 'i13',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Birnen',
    //       ),
    //       Ingredient(
    //         id: 'i14',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Äpfel',
    //       ),
    //       Ingredient(
    //         id: 'i15',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Ingwer',
    //       ),
    //       Ingredient(
    //         id: 'i16',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Zitronen',
    //       ),
    //       Ingredient(
    //         id: 'i17',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Kiwis',
    //       ),
    //       Ingredient(
    //         id: 'i18',
    //         amount: 1,
    //         unit: Unit.piece,
    //         name: 'Bananen',
    //       ),
    //       Ingredient(
    //         id: 'i19',
    //         amount: 500,
    //         unit: Unit.g,
    //         name: 'Haferflocken',
    //       ),
    //       Ingredient(
    //         id: 'i18',
    //         amount: 200,
    //         unit: Unit.g,
    //         name: 'Walnüsse',
    //       ),
    //     ],
    //   ),
  ];
  Recipe deletedRecipe;

  List<Recipe> get recipes {
    return [..._recipes];
  }

  Recipe findById(String id) {
    return _recipes.firstWhere((rec) => rec.id == id);
  }

  var firebaseInstance = FirebaseFirestore.instance.collection('recipes');

  Future<void> loadRecipes() async {
    firebaseInstance.orderBy('createdAt').snapshots().forEach((element) {
      _recipes = element.docs
          .map((docSnap) => Recipe.fromJson(docSnap.data(), docSnap.id))
          .toList();
      notifyListeners();
    });
  }

  Future<void> addRecipe(Recipe recipe) async {
    try {
      firebaseInstance.add(recipe.toMap());
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> addIngredient(String recipeId, Ingredient ingredient) async {
    try {
      firebaseInstance
          .doc(recipeId)
          .collection('ingredients')
          .add(ingredient.toMap());
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> deleteRecipe(String id) async {
    deletedRecipe = _recipes.firstWhere((element) => element.id == id);
    await firebaseInstance.doc(id).delete();
  }

  Future<void> undoDelete() async {
    if (deletedRecipe != null) {
      await firebaseInstance.doc(deletedRecipe.id).set(deletedRecipe.toMap());
      deletedRecipe = null;
      notifyListeners();
    }
  }

  Future<void> updateRecipe(Recipe recipe, String recipeId) async {
    try {
      firebaseInstance.doc(recipeId).update({
        'title': recipe.title,
        // 'ingredients': recipe.ingredients,
      });
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  // void update(Recipe recipe) {
  //   int index = _recipes.indexOf(recipe);
  //   _recipes[index] = recipe;
  //   notifyListeners();
  // }

  // void deleteIngredientFromRecipe(Recipe recipe, String ingredientId) {
  //   recipe.ingredients.remove(ingredientId);
  //   update(recipe);
  //   print(recipe.ingredients.length);
  // }

  // void addIngredientToRecipe(Recipe recipe, Ingredient ingredient) {
  //   recipe.ingredients.add(ingredient);
  //   update(recipe);
  // }
}
