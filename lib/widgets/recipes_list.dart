import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/widgets/common/separated_list_view.dart';
import 'package:groceries_app/widgets/recipe_info.dart';
import 'package:groceries_app/widgets/recipe_placeholder.dart';

class RecipesList extends StatefulWidget {
  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  @override
  Widget build(BuildContext context) {
    final recipesData =
        BlocProvider.of<RecipesCubit>(context, listen: true).state;
    final recipeList = recipesData.recipes;
    return recipesData.loadingState == LoadingState.loading ||
            recipesData.loadingState == LoadingState.uninitialized
        ? Center(
            child: CircularProgressIndicator(),
          )
        : recipeList.isNotEmpty
            ? SeparatedListView(
                itemCount: recipeList.length,
                itemBuilder: (context, index) {
                  return RecipeInfo(
                    recipe: recipeList[index],
                  );
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RecipePlaceholder(),
                ],
              );
  }
}
