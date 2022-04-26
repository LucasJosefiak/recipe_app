import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/tile.dart';

import 'package:groceries_app/widgets/tile_unit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Short title', type: IngredientAmountInfo)
Widget ingredientAmountInfoStory(BuildContext context) {
  return Column(
    children: [
      IngredientAmountInfo(
        recipe: getTestRecipe(context),
        ingredientAmount: getTestIngredientAmount(),
      ),
    ],
  );
}

@WidgetbookUseCase(name: 'Long title', type: IngredientAmountInfo)
Widget ingredientAmountInfoAlternativeStory(BuildContext context) {
  return Column(
    children: [
      IngredientAmountInfo(
        recipe: getTestRecipe(context),
        ingredientAmount: getTestIngredientAmountAlternative(),
      ),
    ],
  );
}

class IngredientAmountInfo extends StatelessWidget {
  final IngredientAmount ingredientAmount;
  final Recipe recipe;
  const IngredientAmountInfo({
    Key? key,
    required this.recipe,
    required this.ingredientAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => BlocProvider.value(
              value: BlocProvider.of<RecipeCubit>(context),
              child: EditIngredientScreen(
                recipe: recipe,
                ingredientAmount: ingredientAmount,
              ),
            ),
          ),
        );
      },
      child: PaddedCard(
        child: Row(
          children: [
            Tile(
              iconData: ingredientAmount.ingredient.unit.icon,
              title: ingredientAmount.ingredient.name,
            ),
            Expanded(child: Container()),
            Text(
              ingredientAmount.amount.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            TileUnit(
              unit: ingredientAmount.ingredient.unit,
            ),
          ],
        ),
      ),
    );
  }
}
