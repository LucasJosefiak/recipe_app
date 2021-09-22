import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/app.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(App());
}
