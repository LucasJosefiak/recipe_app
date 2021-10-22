import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/ingredient_repository.dart';
import 'package:groceries_app/widgets/add_ingredient.dart';

class AddIngredientScreen extends StatelessWidget {
  final Recipe recipe;

  const AddIngredientScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Ingredient'),
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
