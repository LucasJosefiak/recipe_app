import 'package:flutter/material.dart';
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
import 'package:firebase_core/firebase_core.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<RecipesProvider>(
                  create: (ctx) => RecipesProvider(),
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
                  EditIngredientScreen.routeName: (ctx) =>
                      EditIngredientScreen(),
                  AddIngredientScreen.routeName: (ctx) => AddIngredientScreen(),
                },
              ),
            );
          }
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: Text('Loading'),
            ),
          );
        });
  }
}
