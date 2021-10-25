import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:groceries_app/widgets/navigation_bar.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

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
