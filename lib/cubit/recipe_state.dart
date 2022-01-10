part of 'recipe_cubit.dart';

class RecipeState extends Equatable {
  final Recipe recipe;
  const RecipeState({
    required this.recipe,
  });

  @override
  List<Object> get props => [
        recipe,
      ];
}
