import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/test_models.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: EditIngredientScreen)
Widget editIngredientScreenStory(BuildContext context) {
  return EditIngredientScreen(
    recipe: getTestRecipeModel(),
    ingredientAmount: buildIngredientAmountKnobs(context),
  );
}

class EditIngredientScreen extends StatelessWidget {
  final Recipe recipe;
  final IngredientAmount ingredientAmount;

  const EditIngredientScreen({
    Key? key,
    required this.recipe,
    required this.ingredientAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.editIngredient),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<RecipeCubit>(
                context,
              ).removeIngredientFromRecipe(
                recipe: recipe,
                ingredient: ingredientAmount,
              );
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
            ),
          )
        ],
      ),
      body: EditIngredient(
        recipe: recipe,
        ingredientAmount: ingredientAmount,
      ),
    );
  }
}
