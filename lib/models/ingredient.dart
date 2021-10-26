import 'package:hive/hive.dart';

import 'package:groceries_app/models/model.dart';
import 'package:groceries_app/models/unit.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient extends Model {
  @HiveField(0)
  final String identifier;
  @HiveField(1)
  final Unit unit;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final DateTime createdAt;

  Ingredient({
    required this.identifier,
    required this.unit,
    required this.name,
    required this.createdAt,
  });

  @override
  String get id => identifier;

  Ingredient copyWith({
    String? identifier,
    Unit? unit,
    String? name,
    DateTime? createdAt,
  }) {
    return Ingredient(
      identifier: identifier ?? this.identifier,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
