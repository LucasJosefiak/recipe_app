import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/firebase_setup_provider.dart';
import 'package:groceries_app/widgets/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // TODO Put into different class
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());

  await Hive.openBox<Recipe>('recipes');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FirebaseSetupProvider()..initializeFirebase(),
        ),
      ],
      child: App(),
    ),
  );
}
