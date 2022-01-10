import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: IngredientInfo)
Widget ingredientInfoStory(BuildContext buildContext) {
  return Column(
    children: [
      IngredientInfo(
        ingredient: getTestIngredient(),
      ),
    ],
  );
}

class IngredientInfo extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientInfo({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
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
