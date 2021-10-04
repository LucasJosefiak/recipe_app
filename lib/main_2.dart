import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'storybook.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(
    Storybook(),
  );
}
