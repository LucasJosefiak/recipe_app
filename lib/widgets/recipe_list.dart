import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/recipe_list_tile.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  @override
  Widget build(BuildContext context) {
    final recipesData = Provider.of<RecipesProvider>(context, listen: true);
    final recipeList = recipesData.recipes;
    return recipesData.loadingState == LoadingState.loading ||
            recipesData.loadingState == LoadingState.uninitialized
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: recipeList.length,
            itemBuilder: (context, index) {
              return RecipeListTile(
                recipe: recipeList[index],
              );
            },
          );
  }
}
