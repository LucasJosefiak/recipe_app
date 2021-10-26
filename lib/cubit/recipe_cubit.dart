import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/repository.dart';
import 'package:groceries_app/services/id_service.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit({
    required Recipe recipe,
    required this.recipeRepository,
    IdService? idService,
  })  : idService = idService ?? IdService(),
        super(
          RecipeState(
            recipe: recipe,
          ),
        );

  final Repository<Recipe> recipeRepository;
  final IdService idService;

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
    var ingredients = Map<String, IngredientAmount>.from(
      recipe.ingredients,
    );
    ingredients.putIfAbsent(
      ingredient.id,
      () => ingredient,
    );

    recipe = recipe.copyWith(ingredients: ingredients);
    await updateRecipe(recipe);
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    recipeRepository.deleteItem(recipe);
  }

  Future<void> updateRecipe(
    Recipe recipe,
  ) async {
    recipeRepository.updateItem(recipe);
    emit(RecipeState(recipe: recipe));
  }

  Future<void> removeIngredientFromRecipe({
    required Recipe recipe,
    required IngredientAmount ingredient,
  }) async {
    var ingredients = Map<String, IngredientAmount>.from(
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
    var ingredients = Map<String, IngredientAmount>.from(
      recipe.ingredients,
    );
    ingredients[ingredient.id] = ingredient;

    updateRecipe(
      recipe.copyWith(ingredients: ingredients),
    );
  }
}
