part of 'unit_cubit.dart';

class UnitState extends Equatable {
  final List<Unit> units = [
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

  UnitState();

  @override
  List<Object> get props => [
        units,
      ];
}
