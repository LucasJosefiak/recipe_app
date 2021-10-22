import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:hive/hive.dart';

import 'package:groceries_app/models/model.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe extends Model {
  @HiveField(0)
  final String identifier;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime createdAt;
  @HiveField(3)
  final Map<String, IngredientAmount> ingredients;

  Recipe({
    required this.identifier,
    required this.title,
    required this.createdAt,
    Map<String, IngredientAmount>? ingredients,
  }) : this.ingredients = ingredients ?? const <String, IngredientAmount>{};

  @override
  String get id => identifier;

  Recipe copyWith({
    String? identifier,
    String? title,
    DateTime? createdAt,
    Map<String, IngredientAmount>? ingredients,
  }) {
    return Recipe(
      identifier: identifier ?? this.identifier,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
