import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/repositories/recipe_repository.dart';
import 'package:groceries_app/screens/add_ingredient_screen.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/widgets/recipe_detail.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: RecipeDetailsScreen)
Widget recipeDetailsScreenStory(BuildContext context) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => RecipeRepository(),
      )
    ],
    child: RecipeDetailsScreen(
      recipe: getTestRecipe(),
    ),
  );
}

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
        recipeRepository: RepositoryProvider.of<RecipeRepository>(context),
      ),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          var recipe = state.recipe;
          return PaddedScaffold(
            appBar: AppBar(
              title: Text(
                state.recipe.title,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<RecipesCubit>(
                      context,
                      listen: false,
                    ).deleteRecipe(state.recipe);
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.delete,
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
            body: RecipeDetail(
              recipe: recipe,
            ),
          );
        },
      ),
    );
  }
}
