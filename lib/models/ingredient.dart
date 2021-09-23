import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groceries_app/models/unit.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    String? id,
    required int amount,
    required Unit unit,
    required String name,
    required DateTime createdAt,
    @Default(false) bool isChosen,
    @Default(0) int timesChosen,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
