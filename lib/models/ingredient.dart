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

  // TODO check if this makes sense
  @HiveField(4)
  final bool isChosen;
  @HiveField(5)
  final int timesChosen;
  @HiveField(6)
  final int amount;

  Ingredient({
    required this.identifier,
    required this.unit,
    required this.name,
    required this.createdAt,
    required this.amount,
    this.isChosen = false,
    this.timesChosen = 0,
  });

  @override
  String get id => identifier;

  Ingredient copyWith({
    String? identifier,
    Unit? unit,
    String? name,
    DateTime? createdAt,
    bool? isChosen,
    int? timesChosen,
    int? amount,
  }) {
    return Ingredient(
      identifier: identifier ?? this.identifier,
      unit: unit ?? this.unit,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      isChosen: isChosen ?? this.isChosen,
      timesChosen: timesChosen ?? this.timesChosen,
      amount: amount ?? this.amount,
    );
  }
}
