// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_amount.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientAmountAdapter extends TypeAdapter<IngredientAmount> {
  @override
  final int typeId = 4;

  @override
  IngredientAmount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientAmount(
      amount: fields[0] as int,
      ingredient: fields[1] as Ingredient,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientAmount obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.amount)
      ..writeByte(1)
      ..write(obj.ingredient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAmountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
