import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/firebase_setup_provider.dart';
import 'package:groceries_app/widgets/buttons/custom_elevated_button.dart';
import 'package:groceries_app/widgets/ingredient_info.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:provider/provider.dart';
import 'package:storybook/storybook.dart';

import 'storybook.dart';

void main() {
  runApp(
    storyBookHome(
      logo: Container(
        child: Text(
          'Storybook',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      listThemeData: [
        {'Theme': ThemeData()},
        {'Theme dark': ThemeData.dark()}
      ],
      listStoryBookModel: [
        StoryBookModel(
          storyTitle: 'ElevatedButton',
          storyDescription: 'Test',
          story: StoryElementModel(
            builder: (context) => Elevated(
              function: null,
              text: 'Hello',
            ),
          ),
          sourceStoryFilePath:
              'lib/widgets/buttons/custom_elevated_button.dart',
        ),
        StoryBookModel(
          storyTitle: 'RecipeInfo',
          storyDescription: 'Test',
          story: StoryElementModel(
            builder: (context) => RecipeInfo(
              recipe: Recipe(
                title: 'Recipe',
                createdAt: DateTime.now(),
              ),
            ),
          ),
          sourceStoryFilePath:
              'lib/widgets/buttons/custom_elevated_button.dart',
        ),
      ],
    ),
  );
}
