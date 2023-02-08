// *********************************************************************************
// PARABEAC-GENERATED CODE. DO NOT MODIFY.
// 
// FOR MORE INFORMATION ON HOW TO USE PARABEAC, PLEASE VISIT docs.parabeac.com
// *********************************************************************************
    

import 'package:flutter/material.dart';import 'package:recipe_app/theme/recipe_app_text_styles.g.dart';
import 'package:recipe_app/theme/recipe_app_colors.g.dart';

class RecipeAppTheme {

static const TextTheme textTheme = TextTheme(headline1: RecipeAppTextStyles.headline1,headline2: RecipeAppTextStyles.headline2,headline3: RecipeAppTextStyles.headline3,headline4: RecipeAppTextStyles.headline4,headline5: RecipeAppTextStyles.headline5,headline6: RecipeAppTextStyles.headline6,);

static const ColorScheme light = ColorScheme.light(onPrimary: RecipeAppColors.lightOnPrimary,primary: RecipeAppColors.lightPrimary,primaryContainer: RecipeAppColors.lightPrimaryContainer,secondary: RecipeAppColors.lightSecondary,onSecondary: RecipeAppColors.lightOnSecondary,onPrimaryContainer: RecipeAppColors.lightOnPrimaryContainer,secondaryContainer: RecipeAppColors.lightSecondaryContainer,onSecondaryContainer: RecipeAppColors.lightOnSecondaryContainer,shadow: RecipeAppColors.lightShadow);

static  ThemeData themeDataLight = ThemeData(textTheme: textTheme, colorScheme: light,);

static const ColorScheme dark = ColorScheme.dark(primary: RecipeAppColors.darkPrimary,onPrimary: RecipeAppColors.darkOnPrimary,primaryContainer: RecipeAppColors.darkPrimaryContainer,onPrimaryContainer: RecipeAppColors.darkOnPrimaryContainer,secondary: RecipeAppColors.darkSecondary,onSecondary: RecipeAppColors.darkOnSecondary,secondaryContainer: RecipeAppColors.darkSecondaryContainer,onSecondaryContainer: RecipeAppColors.darkOnSecondaryContainer,shadow: RecipeAppColors.darkShadow);

static  ThemeData themeDataDark = ThemeData(textTheme: textTheme, colorScheme: dark,);
}
