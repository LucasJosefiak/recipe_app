import 'package:flutter/material.dart';
import 'package:groceries_app/models/unit.dart';

class UnitProvider with ChangeNotifier {
  List<Unit> units = [
    Unit(name: 'Gram', symbol: 'g', fullSymbol: 'grams'),
    Unit(name: 'Volume', symbol: 'l', fullSymbol: 'litre'),
    Unit(name: 'Piece'),
    Unit(name: 'Can'),
    Unit(name: 'Glass'),
  ];
}
