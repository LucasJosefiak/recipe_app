part of 'ingredients_cubit.dart';

class IngredientsState extends Equatable {
  const IngredientsState.uninitialized()
      : this.ingredients = const <Ingredient>[],
        this.loadingState = LoadingState.uninitialized;

  const IngredientsState.loading()
      : this.ingredients = const <Ingredient>[],
        this.loadingState = LoadingState.loading;

  const IngredientsState.loaded({required this.ingredients})
      : this.loadingState = LoadingState.loading;

  final List<Ingredient> ingredients;
  final LoadingState loadingState;

  @override
  List<Object> get props => [
        ingredients,
        loadingState,
      ];
}
