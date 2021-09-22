import 'package:flutter/material.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:provider/provider.dart';

class EditIngredient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final recipeId = ModalRoute.of(context).settings.arguments as String;
    // final _originalRecipe =
    //     Provider.of<RecipesProvider>(context, listen: false).findById(recipeId);

    final _ingredientNameController =
        TextEditingController(text: 'Original Name of the Ingredient'
            // text: _originalRecipe.ingredients[index].name,
            );
    final _ingredientAmountController = TextEditingController();
    final _ingredientUnitController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Ingredient'),
            textInputAction: TextInputAction.next,
            controller: _ingredientNameController,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Unit'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
