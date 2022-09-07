// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/material/button.dart';
import 'package:flutter/src/material/button_style.dart';
import 'package:flutter/src/material/button_style_button.dart';
import 'package:flutter/src/material/color_scheme.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/src/material/constants.dart';
import 'package:flutter/src/material/elevated_button_theme.dart';
import 'package:flutter/src/material/floating_action_button_theme.dart';
import 'package:flutter/src/material/ink_ripple.dart';
import 'package:flutter/src/material/ink_well.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/outlined_button_theme.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/material/text_button_theme.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/src/material/tooltip.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/app.dart';
import 'package:groceries_app/components.dart';
import 'package:groceries_app/constants/borders.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/screens/recipes_screen.dart';
import 'package:groceries_app/screens/shopping_list_screen.dart';
import 'package:groceries_app/themes/dark_theme.dart';
import 'package:groceries_app/themes/light_theme.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';
import 'package:groceries_app/widgets/add_recipe.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/widgets/common/separated_list_view.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';
import 'package:groceries_app/widgets/ingredient_amount_info.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:groceries_app/widgets/ingredient_overview.dart';
import 'package:groceries_app/widgets/ingredient_prediction.dart';
import 'package:groceries_app/widgets/recipe_detail.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/widgets/recipe_overview.dart';
import 'package:groceries_app/widgets/recipes_list.dart';
import 'package:groceries_app/widgets/shopping_list.dart';
import 'package:groceries_app/widgets/tile.dart';
import 'package:groceries_app/widgets/tile_icon.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/tile_unit.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      appInfo: AppInfo(
        name: 'Recipe App',
      ),
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      frames: [
        WidgetbookFrame.defaultFrame(),
        WidgetbookFrame.noFrame(),
      ],
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: getLightTheme(),
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: getDarkTheme(),
        ),
      ],
      devices: [
        Apple.iPhone13,
        Apple.iPhone13Mini,
      ],
      textScaleFactors: [
        1.0,
        2.0,
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'widgets',
              widgets: [
                WidgetbookComponent(
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
                WidgetbookComponent(
                  name: 'IngredientInfo',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => ingredientInfoStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'IngredientPrediction',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => ingredientPredictionStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'IngredientOverview',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => ingredientOverviewStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'RecipeOverview',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => recipeOverviewStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'RecipeDetail',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => recipeDetailStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
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
                WidgetbookComponent(
                  name: 'AddRecipeScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => addRecipeScreenStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'EditIngredientScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => editIngredientScreenStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'RecipeDetailsScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => recipeDetailsScreenStory(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
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
                WidgetbookComponent(
                  name: 'ShoppingListScreen',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) => shoppingListScreen(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
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
            WidgetbookFolder(
              name: 'material',
              widgets: [
                WidgetbookComponent(
                  name: 'FloatingActionButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Icon',
                      builder: (context) => floatingActionButton(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Extended',
                      builder: (context) =>
                          floatingActionButtonExtended(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'ElevatedButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Text',
                      builder: (context) => elevatedButtonText(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Icon',
                      builder: (context) => elevatedButtonIcon(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'TextButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Text',
                      builder: (context) => textButton(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Icon',
                      builder: (context) => textButtonIcon(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'OutlinedButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Text',
                      builder: (context) => outlineButton(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Icon',
                      builder: (context) => outlineButtonIcon(context),
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
