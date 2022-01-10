// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:groceries_app/themes/light_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/constants/borders.dart';
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
import 'package:widgetbook/widgetbook.dart';

void main() {
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
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [
                WidgetbookWidget(
                  name: 'IngredientAmountInfo',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Short title',
                      builder: (context) => ingredientAmountInfoStory(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Long title',
                      builder: (context) =>
                          ingredientAmountInfoAlternativeStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'IngredientInfo',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => ingredientInfoStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'IngredientPrediction',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => ingredientPredictionStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'IngredientOverview',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => ingredientOverviewStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'RecipeOverview',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => recipeOverviewStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'RecipeDetail',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => recipeDetailStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'RecipeInfo',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => defaultStory(context),
                    ),
                  ],
                ),
              ],
              folders: [],
            ),
            WidgetbookFolder(
              name: 'screens',
              widgets: [
                WidgetbookWidget(
                  name: 'AddRecipeScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => addRecipeScreenStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'EditIngredientScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => editIngredientScreenStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'RecipeDetailsScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => recipeDetailsScreenStory(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'RecipesScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Unloaded',
                      builder: (context) => recipesScreenStoryUnloaded(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Loaded (Empty)',
                      builder: (context) =>
                          recipesScreenStoryLoadedEmpty(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Loaded (Filled)',
                      builder: (context) =>
                          recipesScreenStoryLoadedFilled(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'ShoppingListScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => shoppingListScreen(context),
                    ),
                  ],
                ),
                WidgetbookWidget(
                  name: 'AddIngredientScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => addIngredientScreenStory(context),
                    ),
                  ],
                ),
              ],
              folders: [],
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}
