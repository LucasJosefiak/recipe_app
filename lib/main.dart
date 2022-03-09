import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/adapters/icon_data_adapter.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/shopping_list_ingredient.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookApp.material(
  name: 'Recipe App',
  devices: [
    Apple.iPhone11,
    Samsung.s21ultra,
  ],
  textScaleFactors: [
    1,
    2,
  ],
)
Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeAdapter());
  Hive.registerAdapter(IngredientAdapter());
  Hive.registerAdapter(UnitAdapter());
  Hive.registerAdapter(IconDataAdapter());
  Hive.registerAdapter(IngredientAmountAdapter());
  Hive.registerAdapter(ShoppingListIngredientAdapter());

  await Hive.openBox<Recipe>(RecipeRepository.collectionName);
  await Hive.openBox<Ingredient>(IngredientRepository.collectionName);
  await Hive.openBox<ShoppingListIngredient>(
      ShoppingListRepository.collectionName);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => RecipeRepository(),
        ),
        RepositoryProvider(
          create: (context) => IngredientRepository(),
        ),
        RepositoryProvider(
          create: (context) => ShoppingListRepository(),
        )
      ],
      child: App(),
    ),
  );
}
