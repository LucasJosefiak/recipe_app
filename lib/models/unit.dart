import 'package:hive/hive.dart';

part 'unit.g.dart';

@HiveType(typeId: 2)
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
