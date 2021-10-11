// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UnitAdapter extends TypeAdapter<Unit> {
  @override
  final int typeId = 2;

  @override
  Unit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Unit(
      name: fields[0] as String,
      icon: fields[3] as IconData,
      symbol: fields[1] as String?,
      fullSymbol: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Unit obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.symbol)
      ..writeByte(2)
      ..write(obj.fullSymbol)
      ..writeByte(3)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
