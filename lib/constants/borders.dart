import 'package:flutter/material.dart';
import 'package:groceries_app/constants/radii.dart';

class Borders {
  static const inputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: Radii.textFieldRadius,
  );
}
