import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/widgets/edit_ingredient.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Ingredient'),
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
              FontAwesomeIcons.trash,
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
