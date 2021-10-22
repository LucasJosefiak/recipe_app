import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'unit.g.dart';

@HiveType(typeId: 2)
class Unit extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String symbol;

  @HiveField(2)
  final String fullSymbol;

  @HiveField(3)
  final IconData icon;

  Unit({
    required this.name,
    required this.icon,
    String? symbol,
    String? fullSymbol,
  })  : symbol = symbol ?? 'pcs',
        fullSymbol = fullSymbol ?? 'pieces';

  @override
  List<Object> get props => [
        name,
        symbol,
        fullSymbol,
        // icondata does not compare to well
        // icon,
      ];
}
