// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:groceries_app/adapters/icon_data_adapter.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/models/shopping_list_ingredient.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/themes/light_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/constants/borders.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/themes/dark_theme.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/screens/recipes_screen.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/widgets/recipes_list.dart';
import 'package:groceries_app/widgets/add_recipe.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/screens/shopping_list_screen.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/widgets/shopping_list.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/widgets/recipe_detail.dart';
import 'package:groceries_app/widgets/ingredient_amount_info.dart';
import 'package:groceries_app/widgets/common/separated_list_view.dart';
import 'package:groceries_app/widgets/recipe_overview.dart';
import 'package:groceries_app/widgets/ingredient_overview.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/tile_unit.dart';
import 'package:groceries_app/widgets/tile.dart';
import 'package:groceries_app/widgets/ingredient_prediction.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:hive/hive.dart';
import 'package:widgetbook/widgetbook.dart';

void main() async {
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
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(
        name: 'Recipe App',
      ),
      lightTheme: getLightTheme(),
      darkTheme: getDarkTheme(),
      devices: [
        Device(
          name: 'iPhone 11',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 1792.0,
              width: 828.0,
            ),
            scaleFactor: 2.0,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'S21 Ultra',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 3200.0,
              width: 1440.0,
            ),
            scaleFactor: 3.75,
          ),
          type: DeviceType.mobile,
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'Implementation',
          widgets: [
            WidgetbookWidget(
              name: 'App',
              useCases: [
                WidgetbookUseCase(
                  name: 'Showcase',
                  builder: (context) {
                    return MultiRepositoryProvider(
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
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
