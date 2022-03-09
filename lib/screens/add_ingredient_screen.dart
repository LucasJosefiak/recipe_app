import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/repositories/memory_repository.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@WidgetbookUseCase(name: 'Default', type: AddIngredientScreen)
Widget addIngredientScreenStory(BuildContext context) {
  return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UnitCubit(),
        ),
        BlocProvider(
          create: (context) => IngredientsCubit(
            ingredientRepository: MemoryRepository<Ingredient>(),
          )..addIngredient(
              name: 'Tomato Sauce',
              unit: getTestUnit(),
            ),
        )
      ],
      child: AddIngredientScreen(
        recipe: getTestRecipe(),
      ));
}

class AddIngredientScreen extends StatelessWidget {
  final Recipe recipe;

  const AddIngredientScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addIngredient),
      ),
      body: BlocProvider(
        create: (context) => AddIngredientCubit(
          ingredientRepository: IngredientRepository(),
        ),
        child: AddIngredient(
          recipe: recipe,
        ),
      ),
    );
  }
}
