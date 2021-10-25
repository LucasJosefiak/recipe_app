import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/cubit/ingredients_cubit.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/cubit/unit_cubit.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/widgets/common/text_field_helper.dart';
import 'package:groceries_app/widgets/ingredient_prediction.dart';
import 'package:groceries_app/widgets/unit_info.dart';

class AddIngredient extends StatefulWidget {
  final Recipe recipe;

  const AddIngredient({Key? key, required this.recipe}) : super(key: key);

  @override
  _AddIngredientState createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addIngredientProvider = BlocProvider.of<AddIngredientCubit>(context);

    var units = BlocProvider.of<UnitCubit>(context).state.units;

    return BlocConsumer<AddIngredientCubit, AddIngredientState>(
      listenWhen: (oldState, newState) =>
          oldState != newState && controller.text != newState.name,
      listener: (context, state) {
        controller.text = state.name!;
      },
      builder: (context, state) {
        return Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypeAheadField<Ingredient?>(
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: Radii.textFieldRadius,
                    elevation: 20,
                  ),
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: controller,
                    decoration: TextFieldHelper.getInputDecoration(
                      hintText: 'ingredient name',
                    ),
                  ),
                  getImmediateSuggestions: true,
                  hideOnEmpty: true,
                  itemBuilder: (BuildContext context, Ingredient? ingredient) {
                    return IngredientPrediction(
                      ingredient: ingredient!,
                    );
                  },
                  onSuggestionSelected: (Ingredient? suggestion) {
                    if (suggestion != null) {
                      addIngredientProvider.ingredientChanged(suggestion);
                    }
                  },
                  suggestionsCallback: (String pattern) {
                    addIngredientProvider.nameChanged(pattern);
                    return BlocProvider.of<IngredientsCubit>(
                      context,
                      listen: false,
                    ).state.ingredients.where(
                          (element) => element.name.contains(pattern),
                        );
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButton<Unit>(
                    hint: Text('ingredient unit'),
                    value: state.unit,
                    underline: SizedBox(),
                    items: units.map(
                      (Unit unit) {
                        return DropdownMenuItem<Unit>(
                          value: unit,
                          child: UnitInfo(
                            unit: unit,
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (Unit? unit) {
                      setState(
                        () {
                          addIngredientProvider.unitChanged(unit);
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextFieldHelper.buildTextField(
                  hintText: 'amount',
                  onChanged: (amount) {
                    addIngredientProvider.amountChanged(amount);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    // TODO this is a bit scetchy
                    addIngredientProvider.submit();
                    var ingredient = BlocProvider.of<IngredientsCubit>(
                      context,
                      listen: false,
                    ).addIngredient(
                      name: state.name!,
                      unit: state.unit!,
                    );
                    BlocProvider.of<RecipeCubit>(context).addIngredientToRecipe(
                      widget.recipe,
                      ingredient: ingredient,
                      amount: state.amount!,
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
