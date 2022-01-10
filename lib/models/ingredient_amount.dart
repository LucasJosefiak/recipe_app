import 'package:hive/hive.dart';

import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/model.dart';

part 'ingredient_amount.g.dart';

@HiveType(typeId: 4)
class IngredientAmount extends Model {
  @HiveField(0)
  final int amount;
  @HiveField(1)
  final Ingredient ingredient;

  IngredientAmount({
    required this.amount,
    required this.ingredient,
  });

  @override
  String get id => ingredient.id;

  IngredientAmount copyWith({
    int? amount,
    Ingredient? ingredient,
  }) {
    return IngredientAmount(
      amount: amount ?? this.amount,
      ingredient: ingredient ?? this.ingredient,
    );
  }
}
