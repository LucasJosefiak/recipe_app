import 'package:flutter/material.dart';
import 'package:groceries_app/providers/firebase_setup_provider.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/screens/edit_recipe_screen.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/screens/recipes_screen.dart';
import 'package:groceries_app/screens/shopping_list_screen.dart';
import 'package:groceries_app/widgets/navigation_bar.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Widget _buildLoading() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: Text('Loading'),
      ),
    );
  }

  Widget _buildApp() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RecipesProvider>(
          create: (ctx) => RecipesProvider()..loadRecipes(),
        ),
        ChangeNotifierProvider<ShoppingListProvider>(
          create: (ctx) => ShoppingListProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopping my recipes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => NavigationBar(),
          RecipesScreen.routeName: (ctx) => RecipesScreen(),
          RecipeDetailsScreen.routeName: (ctx) => RecipeDetailsScreen(),
          ShoppingListScreen.routeName: (ctx) => ShoppingListScreen(),
          AddRecipeScreen.routeName: (ctx) => AddRecipeScreen(),
          EditRecipeScreen.routeName: (ctx) => EditRecipeScreen(),
          EditIngredientScreen.routeName: (ctx) => EditIngredientScreen(),
          AddIngredientScreen.routeName: (ctx) => AddIngredientScreen(),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var firebaseSetupProvider = context.watch<FirebaseSetupProvider>();
    return firebaseSetupProvider.isLoading ? _buildLoading() : _buildApp();
  }
}
