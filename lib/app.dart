import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:groceries_app/providers/ingredients_provider.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/providers/unit_provider.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:groceries_app/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecipesProvider>(
          create: (ctx) => RecipesProvider(
            recipeRepository: RepositoryProvider.of<RecipeRepository>(context),
          )..loadRecipes(),
        ),
        ChangeNotifierProvider<ShoppingListProvider>(
          lazy: false,
          create: (ctx) => ShoppingListProvider(
            shoppingListRepository:
                RepositoryProvider.of<ShoppingListRepository>(context),
          )..load(),
        ),
        ChangeNotifierProvider<UnitProvider>(
          create: (ctx) => UnitProvider(),
        ),
        ChangeNotifierProvider<IngredientsProvider>(
          create: (context) => IngredientsProvider(
            ingredientRepository:
                RepositoryProvider.of<IngredientRepository>(context),
          )..load(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping my recipes',
        theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: ColorConstants.darkGreen,
            unselectedItemColor: Colors.black,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.black,
          ),
          textTheme: GoogleFonts.nunitoTextTheme().apply(
            bodyColor: Colors.black,
            decorationColor: Colors.black,
            displayColor: Colors.black,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: ColorConstants.green,
              shape: RoundedRectangleBorder(
                borderRadius: Radii.textFieldRadius,
              ),
            ),
          ),
          scaffoldBackgroundColor: Color(0xFFF2F1F5),
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          cardTheme: CardTheme(
            elevation: 0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: Radii.cardRadius,
            ),
          ),
          appBarTheme: AppBarTheme(
            centerTitle: false,
            elevation: 0,
            color: Colors.transparent,
            foregroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          primaryColor: ColorConstants.darkGreen,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
          ).copyWith(
            secondary: ColorConstants.green,
          ),
        ),
        home: NavigationBar(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildApp();
  }
}
