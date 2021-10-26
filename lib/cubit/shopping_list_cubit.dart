import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit({
    required this.shoppingListRepository,
  }) : super(
          ShoppingListState(
            ingredients: Map(),
          ),
        );

  final ShoppingListRepository shoppingListRepository;

  void load() {
    shoppingListRepository.getStreamOfItems().forEach(
      (elements) {
        emit(
          ShoppingListState(
            ingredients: Map<Ingredient, int>.fromIterable(
              elements,
              key: (k) => k.ingredient,
              value: (v) => v.amount,
            ),
          ),
        );
      },
    );
  }

  void addRecipe(Recipe recipe) {
    for (final ingredient in recipe.ingredients.values) {
      _addIngredient(ingredient);
    }
  }

  void _addIngredient(IngredientAmount ingredientAmount) {
    var ingredients = state.ingredients;
    if (!ingredients.containsKey(ingredientAmount)) {
      ingredients.putIfAbsent(
        ingredientAmount.ingredient,
        () => 0,
      );

      shoppingListRepository.addItem(ingredientAmount);
    }

    ingredients[ingredientAmount.ingredient] =
        ingredients[ingredientAmount.ingredient]! + ingredientAmount.amount;

    shoppingListRepository.updateItem(
      ingredientAmount.copyWith(
        amount: ingredients[ingredientAmount.ingredient],
      ),
    );
  }

  void removeIngredient(Ingredient ingredient) {
    // TODO remove from repository
    state.ingredients.remove(ingredient);
  }

  Future<void> clearCart() async {
    await shoppingListRepository.deleteAll();
  }
}
