import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Unit {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String? symbol;

  @HiveField(2)
  final String? fullSymbol;

  Unit({
    required this.name,
    this.symbol,
    this.fullSymbol,
  });
}
