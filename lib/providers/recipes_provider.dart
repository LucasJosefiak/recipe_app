import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/repository.dart';
import 'package:groceries_app/services/id_service.dart';
import 'package:groceries_app/services/time_service.dart';

class RecipesProvider with ChangeNotifier {
  RecipesProvider(
      {required this.recipeRepository,
      IdService? idService,
      TimeService? timeService})
      : idService = idService ?? IdService(),
        timeService = timeService ?? TimeService();

  final Repository<Recipe> recipeRepository;
  final IdService idService;
  final TimeService timeService;

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
        createdAt: timeService.getNow(),
      ),
    );
  }

  Future<void> _addRecipe(Recipe recipe) async {
    recipeRepository.addItem(recipe);
    notifyListeners();
  }

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
}
