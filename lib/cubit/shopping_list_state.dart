part of 'shopping_list_cubit.dart';

class ShoppingListState extends Equatable {
  final Map<Ingredient, ShoppingListIngredient> ingredients;
  ShoppingListState({
    required this.ingredients,
  });

  @override
  List<Object> get props => [
        ingredients,
      ];
}
