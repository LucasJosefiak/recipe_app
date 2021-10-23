import 'package:flutter/material.dart';
import 'package:groceries_app/models/unit.dart';

class UnitProvider with ChangeNotifier {
  List<Unit> units = [
    Unit(
        name: 'Gram',
        symbol: 'g',
        fullSymbol: 'grams',
        icon: Icons.fitness_center),
    Unit(
      name: 'Volume',
      symbol: 'ml',
      fullSymbol: 'litre',
      icon: Icons.water,
    ),
    Unit(
      name: 'Piece',
      icon: Icons.extension,
    ),
    Unit(
      name: 'Can',
      icon: Icons.liquor,
    ),
    Unit(
      name: 'Bottle',
      icon: Icons.liquor,
    ),
    Unit(
      name: 'Glass',
      icon: Icons.wine_bar,
    ),
  ];
}
