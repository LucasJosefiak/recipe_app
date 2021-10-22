import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/adapters/icon_data_adapter.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/repositories/database_repository.dart';
import 'package:groceries_app/widgets/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // TODO Put into different class
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(UnitAdapter());
  Hive.registerAdapter(IconDataAdapter());
  Hive.registerAdapter(IngredientAmountAdapter());

  await Hive.openBox<Recipe>('recipes');
  await Hive.openBox<Ingredient>('ingredients');

  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => DatabaseRepository<Recipe>(
          'recipes',
        ),
      ),
      RepositoryProvider(
        create: (context) => DatabaseRepository<Ingredient>('ingredients'),
      ),
    ],
    child: App(),
  ));
}
