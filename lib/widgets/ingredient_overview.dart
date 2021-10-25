import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Default', type: IngredientOverview)
Widget ingredientOverviewStory(BuildContext context) {
  return Column(
    children: [
      IngredientOverview(
        ingredient: getTestIngredient(),
      ),
    ],
  );
}

class IngredientOverview extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientOverview({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedCard(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ingredient.name,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Unit: ${ingredient.unit.fullSymbol}',
              )
            ],
          ),
        ],
      ),
    );
  }
}
