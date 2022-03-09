import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:groceries_app/themes/dark_theme.dart';
import 'package:groceries_app/themes/light_theme.dart';
import 'package:groceries_app/widgets/navigation_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

@WidgetbookLocalizationDelegates()
final localizationsDelegates = [
  AppLocalizations.delegate, // Add this line
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

@WidgetbookLocales()
final supportedLocales = [
  Locale('en'),
  Locale('de'),
  Locale('fr'),
];

class _AppState extends State<App> {
  Widget _buildApp() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IngredientsCubit(
            ingredientRepository:
                RepositoryProvider.of<IngredientRepository>(context),
          )..load(),
        ),
        BlocProvider(
          create: (context) => UnitCubit(),
        ),
        BlocProvider(
          create: (context) => RecipesCubit(
            recipeRepository: RepositoryProvider.of<RecipeRepository>(context),
          )..load(),
        ),
        BlocProvider(
          create: (context) => ShoppingListCubit(
            shoppingListRepository:
                RepositoryProvider.of<ShoppingListRepository>(context),
          )..load(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping my recipes',
        theme: getLightTheme(),
        darkTheme: getDarkTheme(),
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        home: MyNavigationBar(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildApp();
  }
}
