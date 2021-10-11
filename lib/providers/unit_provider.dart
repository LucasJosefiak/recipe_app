import 'package:flutter/material.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnitProvider with ChangeNotifier {
  List<Unit> units = [
    Unit(
      name: 'Gram',
      symbol: 'g',
      fullSymbol: 'grams',
      icon: FontAwesomeIcons.weightHanging,
    ),
    Unit(
      name: 'Volume',
      symbol: 'ml',
      fullSymbol: 'litre',
      icon: FontAwesomeIcons.tint,
    ),
    Unit(
      name: 'Piece',
      icon: FontAwesomeIcons.pizzaSlice,
    ),
    Unit(
      name: 'Can',
      icon: FontAwesomeIcons.wineBottle,
    ),
    Unit(
      name: 'Glass',
      icon: FontAwesomeIcons.wineGlass,
    ),
  ];
}
