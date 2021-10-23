// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'dart:core';
import 'package:groceries_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appInfo: AppInfo(name: 'Recipe App'),
      lightTheme: null,
      darkTheme: null,
      categories: [
        Category(
          name: 'stories',
          folders: [
            Folder(
              name: 'widgets',
              widgets: [
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
            )
          ],
        ),
      ],
    );
  }
}
