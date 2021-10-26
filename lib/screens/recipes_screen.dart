import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
import 'package:groceries_app/screens/add_recipe_screen.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/widgets/recipes_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Unloaded', type: RecipesScreen)
Widget recipesScreenStoryUnloaded(BuildContext context) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => MemoryRepository<Recipe>(),
      )
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipesCubit(
            recipeRepository:
                RepositoryProvider.of<MemoryRepository<Recipe>>(context),
          ),
        ),
      ],
      child: RecipesScreen(),
    ),
  );
}

@WidgetbookStory(name: 'Loaded (Empty)', type: RecipesScreen)
Widget recipesScreenStoryLoadedEmpty(BuildContext context) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => MemoryRepository<Recipe>(),
      )
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipesCubit(
            recipeRepository:
                RepositoryProvider.of<MemoryRepository<Recipe>>(context),
          )..load(),
        ),
      ],
      child: RecipesScreen(),
    ),
  );
}

@WidgetbookStory(name: 'Loaded (Filled)', type: RecipesScreen)
Widget recipesScreenStoryLoadedFilled(BuildContext context) {
  final recipe = getTestRecipe();
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => MemoryRepository<Recipe>(
          initialConfiguration: {
            recipe.title: recipe,
          },
        ),
      )
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipesCubit(
            recipeRepository:
                RepositoryProvider.of<MemoryRepository<Recipe>>(context),
          )..load(),
        ),
      ],
      child: RecipesScreen(),
    ),
  );
}

class RecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => AddRecipeScreen(),
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
      body: RecipesList(),
    );
  }
}
