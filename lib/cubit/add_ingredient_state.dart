part of 'add_ingredient_cubit.dart';

class AddIngredientState extends Equatable {
  AddIngredientState({
    this.unit,
    this.name,
    this.amount,
    this.ingredient,
    this.message,
  });

  final Unit? unit;
  final String? name;
  final int? amount;
  final Ingredient? ingredient;
  final String? message;

  @override
  List<Object?> get props => [
        this.unit,
        this.name,
        this.amount,
        this.ingredient,
        this.message,
      ];

  AddIngredientState copyWith({
    Unit? unit,
    String? name,
    int? amount,
    Ingredient? ingredient,
    String? message,
  }) {
    return AddIngredientState(
      unit: unit ?? this.unit,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      ingredient: ingredient ?? this.ingredient,
      message: message ?? this.message,
    );
  }
}
