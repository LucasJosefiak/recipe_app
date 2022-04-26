import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/common/separated_list_view.dart';
import 'package:groceries_app/widgets/ingredient_amount_info.dart';
import 'package:groceries_app/widgets/recipe_overview.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: RecipeDetail)
Widget recipeDetailStory(BuildContext context) {
  return RecipeDetail(
    recipe: getTestRecipe(context),
  );
}

class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecipeOverview(recipe: recipe),
        SizedBox(height: 8),
        Expanded(
          child: SeparatedListView(
            itemCount: recipe.ingredients.length,
            itemBuilder: (context, index) {
              IngredientAmount ingredient =
                  recipe.ingredients.values.elementAt(index);
              return IngredientAmountInfo(
                recipe: recipe,
                ingredientAmount: ingredient,
              );
            },
          ),
        ),
      ],
    );
  }
}
