// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShoppingListIngredientAdapter
    extends TypeAdapter<ShoppingListIngredient> {
  @override
  final int typeId = 5;

  @override
  ShoppingListIngredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShoppingListIngredient(
      ingredient: fields[0] as Ingredient,
      amount: fields[1] as int,
      isChecked: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ShoppingListIngredient obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ingredient)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShoppingListIngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
