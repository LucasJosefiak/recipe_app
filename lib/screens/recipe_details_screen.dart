import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/repositories/database_repository.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/widgets/ingredients_list.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCubit(
        recipe: recipe,
        recipeRepository:
            RepositoryProvider.of<DatabaseRepository<Recipe>>(context),
      ),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                state.recipe.title,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Provider.of<RecipesProvider>(
                      context,
                      listen: false,
                    ).deleteRecipe(state.recipe);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    FontAwesomeIcons.trash,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => BlocProvider.value(
                      value: BlocProvider.of<RecipeCubit>(context),
                      child: AddIngredientScreen(
                        recipe: state.recipe,
                      ),
                    ),
                  ),
                );
              },
              label: Text(
                'Add',
              ),
              icon: Icon(
                Icons.add,
              ),
            ),
            body: IngredientsList(recipe: state.recipe),
          );
        },
      ),
    );
  }
}
