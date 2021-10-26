import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class IconDataAdapter extends TypeAdapter<IconData> {
  @override
  IconData read(BinaryReader reader) {
    return IconData(
      reader.read(),
      fontFamily: reader.read(),
      fontPackage: reader.read(),
      matchTextDirection: reader.read(),
    );
  }

  @override
  int get typeId => 3;

  @override
  void write(BinaryWriter writer, IconData obj) {
    writer.write(obj.codePoint);
    writer.write(obj.fontFamily);
    writer.write(obj.fontPackage);
    writer.write(obj.matchTextDirection);
  }
}
