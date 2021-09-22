import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/widgets/recipe_list.dart';

class RecipesScreen extends StatelessWidget {
  static const routeName = '/recipes-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: RecipeList(),
      // body: Column(
      //   children: [
      //     // RecipeList(),
      //     TextButton(
      //       onPressed: () {
      //         FirebaseFirestore.instance
      //             .collection('recipes')
      //             .snapshots()
      //             .listen((event) {
      //           print(event.docs);
      //         });
      //       },
      //       child: Text('Hello'),
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddRecipeScreen.routeName);
        },
      ),
    );
  }
}
