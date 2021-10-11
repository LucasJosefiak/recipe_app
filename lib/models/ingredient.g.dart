// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IngredientAdapter extends TypeAdapter<Ingredient> {
  @override
  final int typeId = 1;

  @override
  Ingredient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ingredient(
      unit: fields[0] as Unit,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime,
      amount: fields[5] as int,
      isChosen: fields[3] as bool,
      timesChosen: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Ingredient obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.unit)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.isChosen)
      ..writeByte(4)
      ..write(obj.timesChosen)
      ..writeByte(5)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
