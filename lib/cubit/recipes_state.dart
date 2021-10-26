part of 'recipes_cubit.dart';

class RecipesState extends Equatable {
  final List<Recipe> recipes;

  final Recipe? deletedRecipe;
  final LoadingState loadingState;

  RecipesState({
    this.recipes = const <Recipe>[],
    this.deletedRecipe,
    this.loadingState = LoadingState.uninitialized,
  });

  @override
  List<Object?> get props => [
        recipes,
        deletedRecipe,
        loadingState,
      ];

  RecipesState copyWith({
    List<Recipe>? recipes,
    Recipe? deletedRecipe,
    LoadingState? loadingState,
  }) {
    return RecipesState(
      recipes: recipes ?? this.recipes,
      deletedRecipe: deletedRecipe ?? this.deletedRecipe,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
