import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/shopping_list_ingredient.dart';
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
            ingredients: Map<Ingredient, ShoppingListIngredient>.fromIterable(
              elements,
              key: (k) => k.ingredient,
              value: (v) => v,
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

    late ShoppingListIngredient shoppingListIngredient;
    if (!ingredients.containsKey(ingredientAmount.ingredient)) {
      shoppingListIngredient = ShoppingListIngredient(
        ingredient: ingredientAmount.ingredient,
        amount: 0,
        isChecked: false,
      );
      ingredients.putIfAbsent(
          ingredientAmount.ingredient, () => shoppingListIngredient);

      shoppingListRepository.addItem(shoppingListIngredient);
    }

    shoppingListIngredient = ingredients[ingredientAmount.ingredient]!;
    ingredients[ingredientAmount.ingredient] = shoppingListIngredient.copyWith(
      amount: shoppingListIngredient.amount + ingredientAmount.amount,
    );

    shoppingListRepository.updateItem(
      ingredients[ingredientAmount.ingredient]!,
    );
  }

  void removeIngredient(Ingredient ingredient) {
    // TODO remove from repository
    state.ingredients.remove(ingredient);
  }

  Future<void> clearCart() async {
    await shoppingListRepository.deleteAll();
  }

  void checkIngredient(Ingredient ingredient) {
    final listIngredient = state.ingredients[ingredient]!;
    final newListIngredient = state.ingredients[ingredient]!
        .copyWith(isChecked: !listIngredient.isChecked);
    shoppingListRepository.updateItem(newListIngredient);
  }
}
