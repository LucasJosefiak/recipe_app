import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/unit.dart';

class TileUnit extends StatelessWidget {
  final Unit unit;
  const TileUnit({
    Key? key,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorConstants.grey,
          ),
          child: Center(
            child: Text(
              unit.symbol,
            ),
          ),
        ),
      ],
    );
  }
}
