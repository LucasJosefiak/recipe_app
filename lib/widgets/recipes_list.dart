import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/widgets/buttons/custom_elevated_button.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/widgets/recipe_placeholder.dart';
import 'package:provider/provider.dart';

class RecipesList extends StatefulWidget {
  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  Widget build(BuildContext context) {
    final recipesData = Provider.of<RecipesProvider>(context, listen: true);
    final recipeList = recipesData.recipes;
    return recipesData.loadingState == LoadingState.loading ||
            recipesData.loadingState == LoadingState.uninitialized
        ? Center(
            child: CircularProgressIndicator(),
          )
        : recipeList.isNotEmpty
            ? Column(
                children: [
                  SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 8);
                      },
                      itemCount: recipeList.length,
                      itemBuilder: (context, index) {
                        return RecipeInfo(
                          recipe: recipeList[index],
                        );
                        // return RecipeListTile(
                        //   recipe: recipeList[index],
                        // );
                      },
                    ),
                  ),
                  Elevated(
                    function: () {
                      Navigator.pushNamed(context, AddRecipeScreen.routeName);
                    },
                    text: 'Add new recipe',
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RecipePlaceholder(),
                  SizedBox(height: 96),
                  Elevated(
                    function: () {
                      Navigator.pushNamed(context, AddRecipeScreen.routeName);
                    },
                    text: 'Add new recipe',
                  ),
                ],
              );
  }
}
