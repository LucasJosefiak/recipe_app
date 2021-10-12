import 'package:flutter/material.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/widgets/tile_icon.dart';

class UnitInfo extends StatelessWidget {
  final Unit unit;
  const UnitInfo({
    Key? key,
    required this.unit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TileIcon(
          iconData: unit.icon,
        ),
        SizedBox(
          width: 24,
        ),
        Text('${unit.name} (${unit.symbol})'),
      ],
    );
  }
}
