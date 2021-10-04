import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/providers/firebase_setup_provider.dart';
import 'package:provider/provider.dart';

import 'storybook.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseSetupProvider()..initializeFirebase(),
          //TODO @Jens: What does ".." do here. I know that it's the cascade operator but in this case I don't get it.
        ),
      ],
      child: Storybook(),
    ),
  );
}
