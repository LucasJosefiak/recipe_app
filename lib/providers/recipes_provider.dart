import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  Recipe? deletedRecipe;
  LoadingState loadingState = LoadingState.uninitialized;

  List<Recipe> get recipes {
    return [..._recipes];
  }

  Recipe findById(String id) {
    return _recipes.firstWhere((rec) => rec.id == id);
  }

  var firebaseInstance = FirebaseFirestore.instance.collection('recipes');

  Future<void> loadRecipes() async {
    loadingState = LoadingState.loading;
    notifyListeners();
    firebaseInstance.orderBy('createdAt').snapshots().forEach((element) {
      _recipes = element.docs.map((docSnap) {
        var jsonData = docSnap.data();
        jsonData['id'] = docSnap.id;
        return Recipe.fromJson(jsonData);
      }).toList();

      loadingState = LoadingState.loaded;
      notifyListeners();
    });
  }

  Future<void> addRecipe(Recipe recipe) async {
    try {
      firebaseInstance.add(recipe.toJson());
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  Future<void> addIngredient(Recipe recipe, Ingredient ingredient) async {
    var ingredients = List<Ingredient>.from(
      recipe.ingredients,
      growable: true,
    );
    ingredients.add(ingredient);
    recipe = recipe.copyWith(ingredients: ingredients);
    updateRecipe(recipe);
    notifyListeners();
  }

  Future<void> deleteRecipe(String id) async {
    deletedRecipe = _recipes.firstWhere((element) => element.id == id);
    await firebaseInstance.doc(id).delete();
  }

  Future<void> undoDelete() async {
    var recipe = deletedRecipe;
    if (recipe != null) {
      await firebaseInstance.doc(recipe.id).set(recipe.toJson());
      deletedRecipe = null;
      notifyListeners();
    }
  }

  Future<void> updateRecipe(
    Recipe recipe,
  ) async {
    try {
      firebaseInstance.doc(recipe.id).update(recipe.toJson());
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
