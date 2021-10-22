import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:collection';

import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/repository.dart';
import 'package:groceries_app/services/id_service.dart';
import 'package:groceries_app/services/time_service.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit({
    required this.recipeRepository,
    IdService? idService,
    TimeService? timeService,
  })  : idService = idService ?? IdService(),
        timeService = timeService ?? TimeService(),
        super(RecipesState());

  final Repository<Recipe> recipeRepository;
  final IdService idService;
  final TimeService timeService;

  Future<void> loadRecipes() async {
    emit(
      state.copyWith(
        loadingState: LoadingState.loading,
      ),
    );

    recipeRepository.getStreamOfItems().forEach(
      (recipes) {
        emit(
          state.copyWith(
            loadingState: LoadingState.loaded,
            recipes: recipes,
          ),
        );
      },
    );
  }

  Future<void> addRecipe(String title) async {
    _addRecipe(
      Recipe(
          identifier: idService.getId(),
          title: title,
          createdAt: timeService.getNow()),
    );
  }

  Future<void> _addRecipe(Recipe recipe) async {
    recipeRepository.addItem(recipe);
  }

  Future<void> addIngredientToRecipe(
    Recipe recipe, {
    required Ingredient ingredient,
    required int amount,
  }) async {
    _addIngredient(
      recipe,
      IngredientAmount(
        ingredient: ingredient,
        amount: amount,
      ),
    );
  }

  Future<void> _addIngredient(
      Recipe recipe, IngredientAmount ingredient) async {
    var ingredients = HashMap<String, IngredientAmount>.from(
      recipe.ingredients,
    );
    ingredients.putIfAbsent(
      ingredient.id,
      () => ingredient,
    );

    recipe = recipe.copyWith(ingredients: ingredients);
    updateRecipe(recipe);
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    recipeRepository.deleteItem(recipe);
  }

  Future<void> undoDelete() async {
    var recipe = state.deletedRecipe;
    if (recipe != null) {
      emit(
        RecipesState(
          loadingState: state.loadingState,
          recipes: state.recipes,
        ),
      );

      _addRecipe(recipe);
    }
  }

  Future<void> updateRecipe(
    Recipe recipe,
  ) async {
    recipeRepository.updateItem(recipe);
  }

  Future<void> removeIngredientFromRecipe({
    required Recipe recipe,
    required IngredientAmount ingredient,
  }) async {
    var ingredients = HashMap<String, IngredientAmount>.from(
      recipe.ingredients,
    );
    ingredients.remove(ingredient.id);

    updateRecipe(
      recipe.copyWith(ingredients: ingredients),
    );
  }

  Future<void> updateIngredientOfRecipe({
    required Recipe recipe,
    required IngredientAmount ingredient,
  }) async {
    var ingredients = HashMap<String, IngredientAmount>.from(
      recipe.ingredients,
    );
    ingredients[ingredient.id] = ingredient;

    updateRecipe(
      recipe.copyWith(ingredients: ingredients),
    );
  }
}
