import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';

class IngredientInfo extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientInfo({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            TileIcon(iconData: ingredient.unit.icon),
            SizedBox(
              width: 24,
            ),
            TileTitle(
              title: ingredient.name,
            ),
          ],
        ),
      ),
    );
  }
}
