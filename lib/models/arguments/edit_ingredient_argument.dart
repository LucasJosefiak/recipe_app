import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';

class EditIngredientArgument {
  final Recipe recipe;
  final Ingredient ingredient;

  EditIngredientArgument({
    required this.recipe,
    required this.ingredient,
  });
}
