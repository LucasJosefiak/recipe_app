import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';

class Tile extends StatelessWidget {
  final IconData iconData;
  final String title;
  const Tile({
    Key? key,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TileIcon(
          iconData: iconData,
        ),
        SizedBox(
          width: 24,
        ),
        TileTitle(
          title: title,
        ),
      ],
    );
  }
}
