import 'package:flutter/material.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/widgets/recipe_list_tile.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatefulWidget {
  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<RecipesProvider>(context).loadRecipes().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final recipesData = Provider.of<RecipesProvider>(context, listen: true);
    final recipeList = recipesData.recipes;
    return _isLoading
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
