import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/repositories/repository.dart';
import 'package:groceries_app/services/id_service.dart';

class RecipesProvider with ChangeNotifier {
  RecipesProvider({
    required this.recipeRepository,
    IdService? idService,
  }) : idService = idService ?? IdService();

  final Repository<Recipe> recipeRepository;
  final IdService idService;

  List<Recipe> _recipes = [];

  Recipe? deletedRecipe;
  LoadingState loadingState = LoadingState.uninitialized;

  List<Recipe> get recipes {
    return [..._recipes];
  }

  Recipe findByTitle(String title) {
    return _recipes.firstWhere((rec) => rec.title == title);
  }

  Future<void> loadRecipes() async {
    loadingState = LoadingState.loading;
    notifyListeners();
    recipeRepository.getStreamOfItems().forEach((recipes) {
      _recipes = recipes;

      loadingState = LoadingState.loaded;
      notifyListeners();
    });
  }

  Future<void> addRecipeByTitle(String title) async {
    addRecipe(
      Recipe(
        identifier: idService.getId(),
        title: title,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> addRecipe(Recipe recipe) async {
    recipeRepository.addItem(recipe);
    notifyListeners();
  }

  Future<void> addIngredient(
    Recipe recipe, {
    required Unit unit,
    required String name,
    required int amount,
  }) async {
    _addIngredient(
      recipe,
      Ingredient(
        identifier: idService.getId(),
        unit: unit,
        name: name,
        createdAt: DateTime.now(),
        amount: amount,
      ),
    );
  }

  Future<void> _addIngredient(Recipe recipe, Ingredient ingredient) async {
    var ingredients = List<Ingredient>.from(
      recipe.ingredients,
      growable: true,
    );

    ingredients.add(ingredient);
    recipe = recipe.copyWith(ingredients: ingredients);
    updateRecipe(recipe);
    notifyListeners();
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    recipeRepository.deleteItem(recipe);
  }

  Future<void> undoDelete() async {
    var recipe = deletedRecipe;
    if (recipe != null) {
      deletedRecipe = null;
      addRecipe(recipe);
    }
  }

  Future<void> updateRecipe(
    Recipe recipe,
  ) async {
    recipeRepository.updateItem(recipe);
  }

  Future<void> deleteIngredient({
    required Recipe recipe,
    required Ingredient ingredient,
  }) async {
    var ingredients = recipe.ingredients;
    var oldIngredient = ingredients.firstWhere(
      (element) => element.id == ingredient.id,
    );
    var ingredientIndex = ingredients.indexOf(oldIngredient);
    ingredients.removeAt(ingredientIndex);
    updateRecipe(
      recipe.copyWith(ingredients: ingredients),
    );
  }

  Future<void> updateIngredient({
    required Recipe recipe,
    required Ingredient ingredient,
  }) async {
    try {
      var ingredients = recipe.ingredients;
      var oldIngredient = ingredients.firstWhere(
        (element) => element.id == ingredient.id,
      );
      var ingredientIndex = ingredients.indexOf(oldIngredient);
      ingredients[ingredientIndex] = ingredient;
      updateRecipe(
        recipe.copyWith(ingredients: ingredients),
      );
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }
}
