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
import 'package:groceries_app/widgets/recipe_overview.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/recipe_detail.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/widgets/ingredient_amount_info.dart';
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
      darkTheme: null,
      categories: [
        Category(
          name: 'stories',
          folders: [
            Folder(
              name: 'widgets',
              widgets: [
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
                WidgetElement(
                  name: 'RecipeOverview',
                  stories: [
                    Story(
                      name: 'Default',
                      builder: (context) => recipeOverviewStory(context),
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
