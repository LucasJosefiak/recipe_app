import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';

class Checkmark extends StatelessWidget {
  final double size;
  final bool isChecked;
  final Function() onPressed;

  const Checkmark({
    Key? key,
    required this.isChecked,
    required this.onPressed,
    this.size = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onPressed(),
      child: CircleAvatar(
        radius: this.size / 2 + 8,
        backgroundColor: _backgroundColor(context),
        child: Icon(
          Icons.check,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _backgroundColor(BuildContext context) {
    Color color = Theme.of(context).brightness == Brightness.light
        ? ColorConstants.grey
        : ColorConstants.accentGrey;
    ;

    if (isChecked) {
      color = Theme.of(context).brightness == Brightness.light
          ? ColorConstants.green
          : ColorConstants.darkGreen;
    }

    return color;
  }
}
