import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';

class EditIngredientArgument {
  final Recipe recipe;
  final IngredientAmount ingredientAmount;

  EditIngredientArgument({
    required this.recipe,
    required this.ingredientAmount,
  });
}
