import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/model.dart';
import 'package:hive/hive.dart';

part 'shopping_list_ingredient.g.dart';

@HiveType(typeId: 5)
class ShoppingListIngredient extends Model {
  @HiveField(0)
  final Ingredient ingredient;
  @HiveField(1)
  final int amount;
  @HiveField(2)
  final bool isChecked;

  ShoppingListIngredient({
    required this.ingredient,
    required this.amount,
    required this.isChecked,
  });

  ShoppingListIngredient copyWith({
    Ingredient? ingredient,
    int? amount,
    bool? isChecked,
  }) {
    return ShoppingListIngredient(
      ingredient: ingredient ?? this.ingredient,
      amount: amount ?? this.amount,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String get id => ingredient.id;
}
