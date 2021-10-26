// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:groceries_app/themes/light_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/constants/radii.dart';
import 'dart:core';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/themes/dark_theme.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/screens/recipes_screen.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
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
import 'package:groceries_app/widgets/recipe_detail.dart';
import 'package:groceries_app/widgets/ingredient_overview.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/ingredient_amount_info.dart';
import 'package:groceries_app/widgets/tile_unit.dart';
import 'package:groceries_app/widgets/tile.dart';
import 'package:groceries_app/widgets/recipe_overview.dart';
import 'package:groceries_app/widgets/ingredient_prediction.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/widgets/common/separated_list_view.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(name: 'Recipe App'),
      lightTheme: getLightTheme(),
      darkTheme: getDarkTheme(),
      categories: [
        Category(
          name: 'stories',
          folders: [
            Folder(
              name: 'widgets',
              widgets: [
                WidgetElement(
                  name: 'IngredientAmountInfo',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => ingredientAmountInfoStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'IngredientInfo',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => ingredientInfoStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'IngredientPrediction',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => ingredientPredictionStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'IngredientOverview',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => ingredientOverviewStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'RecipeOverview',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => recipeOverviewStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'RecipeDetail',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => recipeDetailStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'RecipeInfo',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => defaultStory(context),
                    ),
                  ],
                ),
              ],
            ),
            Folder(
              name: 'screens',
              widgets: [
                WidgetElement(
                  name: 'AddRecipeScreen',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => addRecipeScreenStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'EditIngredientScreen',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => editIngredientScreenStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'RecipeDetailsScreen',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => recipeDetailsScreenStory(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'RecipesScreen',
                  stories: [
                    Story(
                      name: 'Unloaded',
                      builder: (context) => recipesScreenStoryUnloaded(context),
                    ),
                    Story(
                      name: 'Loaded (Empty)',
                      builder: (context) =>
                          recipesScreenStoryLoadedEmpty(context),
                    ),
                    Story(
                      name: 'Loaded (Filled)',
                      builder: (context) =>
                          recipesScreenStoryLoadedFilled(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'ShoppingListScreen',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => shoppingListScreen(context),
                    ),
                  ],
                ),
                WidgetElement(
                  name: 'AddIngredientScreen',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => addIngredientScreenStory(context),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
