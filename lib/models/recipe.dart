import 'package:hive/hive.dart';

import 'package:groceries_app/models/ingredient.dart';
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
  final List<Ingredient> ingredients;

  Recipe({
    required this.identifier,
    required this.title,
    required this.createdAt,
    List<Ingredient>? ingredients,
  }) : this.ingredients = ingredients ?? const <Ingredient>[];

  @override
  String get id => identifier;

  Recipe copyWith({
    String? identifier,
    String? title,
    DateTime? createdAt,
    List<Ingredient>? ingredients,
  }) {
    return Recipe(
      identifier: identifier ?? this.identifier,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      ingredients: ingredients ?? this.ingredients,
    );
  }
}
