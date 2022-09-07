import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:widgetbook/widgetbook.dart';

Unit getTestUnit() {
  return Unit(
    name: 'Volume',
    symbol: 'ml',
    fullSymbol: 'litre',
    icon: Icons.water,
  );
}

Ingredient getTestIngredient() {
  return Ingredient(
    identifier: '1',
    unit: getTestUnit(),
    name: 'Tomato Sauce',
    createdAt: DateTime.now(),
  );
}

IngredientAmount getTestIngredientAmount({
  Ingredient? defaultIngredient,
}) {
  final ingredient = getTestIngredient();
  return IngredientAmount(
    amount: 100,
    ingredient: defaultIngredient ?? ingredient,
  );
}

Ingredient getTestIngredientAlternative() {
  return Ingredient(
    identifier: '1',
    unit: Unit(
      name: 'Piece',
      icon: Icons.extension,
    ),
    name: 'Tomato Sauce with Basilikum and Garlic',
    createdAt: DateTime.now(),
  );
}

final List<Unit> units = [
  Unit(
    name: 'Gram',
    symbol: 'g',
    fullSymbol: 'grams',
    icon: Icons.fitness_center,
  ),
  Unit(
    name: 'Volume',
    symbol: 'ml',
    fullSymbol: 'litre',
    icon: Icons.water,
  ),
  Unit(
    name: 'Piece',
    icon: Icons.extension,
  ),
  Unit(
    name: 'Can',
    icon: Icons.liquor,
  ),
  Unit(
    name: 'Bottle',
    icon: Icons.liquor,
  ),
  Unit(
    name: 'Glass',
    icon: Icons.wine_bar,
  ),
];

Ingredient buildIngredientKnobs(BuildContext context) {
  return Ingredient(
    identifier: '1',
    unit: context.knobs.options<Unit>(
      label: 'Unit',
      options: units.map((e) => Option(label: e.name, value: e)).toList(),
    ),
    name: context.knobs.text(
      label: 'Ingredient name',
      initialValue: 'Tomato Sauce',
    ),
    createdAt: DateTime.now(),
  );
}

IngredientAmount buildIngredientAmountKnobs(
  BuildContext context,
) {
  return IngredientAmount(
    amount: context.knobs
        .number(
          label: 'Amount',
          description: 'The number of units.',
          initialValue: 100,
        )
        .toInt(),
    ingredient: buildIngredientKnobs(context),
  );
}

IngredientAmount getTestIngredientAmountAlternative() {
  final ingredient = getTestIngredientAlternative();
  return IngredientAmount(
    amount: 100,
    ingredient: ingredient,
  );
}

Recipe getTestRecipeModel() {
  return Recipe(
    identifier: '1',
    title: 'Lasagna',
    createdAt: DateTime.now(),
  );
}

Recipe buildRecipeKnobs(BuildContext context) {
  final ingredientAmount = buildIngredientAmountKnobs(context);
  return Recipe(
    identifier: '1',
    title: context.knobs.text(
      label: 'Title',
      initialValue: 'Lasagna',
    ),
    createdAt: DateTime.now(),
    ingredients: {
      ingredientAmount.ingredient.name: ingredientAmount,
    },
  );
}
