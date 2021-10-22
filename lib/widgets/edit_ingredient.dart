import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/providers/unit_provider.dart';
import 'package:groceries_app/widgets/ingredient_overview.dart';
import 'package:provider/provider.dart';

import 'buttons/save_button.dart';

class EditIngredient extends StatefulWidget {
  final IngredientAmount ingredientAmount;
  final Recipe recipe;

  const EditIngredient({
    Key? key,
    required this.ingredientAmount,
    required this.recipe,
  }) : super(key: key);

  @override
  _EditIngredientState createState() => _EditIngredientState();
}

class _EditIngredientState extends State<EditIngredient> {
  @override
  Widget build(BuildContext context) {
    var units = Provider.of<UnitProvider>(context).units;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          IngredientOverview(
            ingredient: widget.ingredientAmount.ingredient,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: TextEditingController(
                text: '${widget.ingredientAmount.amount}'),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value != null &&
                  value.isEmpty &&
                  int.tryParse(value) != null) {
                return 'Please provide a value.';
              }
              return null;
              // null means no error (coorect Form)
            },
            onChanged: (value) {
              var intValue = int.tryParse(value);
              if (intValue != null) {
                BlocProvider.of<RecipeCubit>(context).updateIngredientOfRecipe(
                  recipe: widget.recipe,
                  ingredient: widget.ingredientAmount.copyWith(
                    amount: intValue,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
