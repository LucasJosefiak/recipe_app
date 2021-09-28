import 'package:flutter/material.dart';
import 'package:groceries_app/providers/firebase_setup_provider.dart';
import 'package:groceries_app/widgets/app.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseSetupProvider()..initializeFirebase(),
          //TODO what does ".." do?
        ),
      ],
      child: App(),
    ),
  );
}
