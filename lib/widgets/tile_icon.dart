import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';

class TileIcon extends StatelessWidget {
  final IconData iconData;
  final double size;
  const TileIcon({
    Key? key,
    required this.iconData,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.size / 2 + 8,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? ColorConstants.green
          : ColorConstants.darkGreen,
      child: Icon(
        iconData,
        size: 20,
        color: Colors.white,
      ),
    );
  }
}
