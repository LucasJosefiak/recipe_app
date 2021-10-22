import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/models/recipe.dart';
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

  Future<void> addRecipe(String title) async {
    _addRecipe(
      Recipe(
        identifier: idService.getId(),
        title: title,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> _addRecipe(Recipe recipe) async {
    recipeRepository.addItem(recipe);
    notifyListeners();
  }

  // Future<void> addIngredientToRecipe(
  //   Recipe recipe, {
  //   required Ingredient ingredient,
  //   required int amount,
  // }) async {
  //   _addIngredient(
  //     recipe,
  //     IngredientAmount(
  //       ingredient: ingredient,
  //       amount: amount,
  //     ),
  //   );
  // }

  // Future<void> _addIngredient(
  //     Recipe recipe, IngredientAmount ingredient) async {
  //   var ingredients = HashMap<String, IngredientAmount>.from(
  //     recipe.ingredients,
  //   );
  //   ingredients.putIfAbsent(
  //     ingredient.id,
  //     () => ingredient,
  //   );

  //   recipe = recipe.copyWith(ingredients: ingredients);
  //   updateRecipe(recipe);
  // }

  Future<void> deleteRecipe(Recipe recipe) async {
    recipeRepository.deleteItem(recipe);
  }

  Future<void> undoDelete() async {
    var recipe = deletedRecipe;
    if (recipe != null) {
      deletedRecipe = null;
      _addRecipe(recipe);
    }
  }

  Future<void> updateRecipe(
    Recipe recipe,
  ) async {
    recipeRepository.updateItem(recipe);
  }

  // Future<void> removeIngredientFromRecipe({
  //   required Recipe recipe,
  //   required IngredientAmount ingredient,
  // }) async {
  //   var ingredients = HashMap<String, IngredientAmount>.from(
  //     recipe.ingredients,
  //   );
  //   ingredients.remove(ingredient.id);

  //   updateRecipe(
  //     recipe.copyWith(ingredients: ingredients),
  //   );
  // }

  // Future<void> updateIngredientOfRecipe({
  //   required Recipe recipe,
  //   required IngredientAmount ingredient,
  // }) async {
  //   var ingredients = HashMap<String, IngredientAmount>.from(
  //     recipe.ingredients,
  //   );
  //   ingredients[ingredient.id] = ingredient;

  //   updateRecipe(
  //     recipe.copyWith(ingredients: ingredients),
  //   );
  // }
}
