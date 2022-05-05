import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: IngredientPrediction)
Widget ingredientPredictionStory(BuildContext context) {
  return Column(
    children: [
      IngredientPrediction(
        ingredient: getTestIngredient(context),
      ),
    ],
  );
}

class IngredientPrediction extends StatelessWidget {
  const IngredientPrediction({
    Key? key,
    required this.ingredient,
  }) : super(key: key);
  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          TileIcon(iconData: ingredient.unit.icon),
          SizedBox(
            width: 24,
          ),
          TileTitle(
            title: ingredient.name,
          ),
        ],
      ),
    );
  }
}
