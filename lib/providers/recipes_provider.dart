import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
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

  Future<void> updateRecipe(
    Recipe recipe,
  ) async {
    try {
      firebaseInstance.doc(recipe.id).update({
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
