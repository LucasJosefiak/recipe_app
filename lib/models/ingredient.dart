import 'package:groceries_app/models/model.dart';
import 'package:hive/hive.dart';

import 'package:groceries_app/models/unit.dart';

part 'ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient extends Model {
  @HiveField(0)
  final Unit unit;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final DateTime createdAt;

  // TODO check if this makes sense
  @HiveField(3)
  final bool isChosen;
  @HiveField(4)
  final int timesChosen;
  @HiveField(5)
  final int amount;

  Ingredient({
    required this.unit,
    required this.name,
    required this.createdAt,
    required this.amount,
    this.isChosen = false,
    this.timesChosen = 0,
  });

  Ingredient copyWith({
    Unit? unit,
    String? name,
    DateTime? createdAt,
    bool? isChosen,
    int? timesChosen,
    int? amount,
  }) {
    return Ingredient(
      unit: unit ?? this.unit,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      isChosen: isChosen ?? this.isChosen,
      timesChosen: timesChosen ?? this.timesChosen,
    );
  }

  @override
  String get id => name;
}
