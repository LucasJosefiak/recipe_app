import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:groceries_app/constants/radii.dart';
import 'package:groceries_app/cubit/add_ingredient_cubit.dart';
import 'package:groceries_app/cubit/recipe_cubit.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/providers/ingredients_provider.dart';
import 'package:groceries_app/providers/unit_provider.dart';
import 'package:groceries_app/widgets/common/text_field_helper.dart';
import 'package:groceries_app/widgets/ingredient_prediction.dart';
import 'package:groceries_app/widgets/unit_info.dart';
import 'package:provider/provider.dart';

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

    var units = Provider.of<UnitProvider>(context).units;

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
                    return Provider.of<IngredientsProvider>(
                      context,
                      listen: false,
                    ).ingredients.where(
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
                    var ingredient = Provider.of<IngredientsProvider>(
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
//  final _form = GlobalKey<FormState>();

//   void _saveForm() {
//     final isValid = _form.currentState.validate();
//     if (!isValid) {
//       return;
//     }
//     _form.currentState.save();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _form,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: ingredientNameController,
//               decoration: InputDecoration(
//                 labelText: 'Ingredient',
//                 // errorText:

//                 // ingredientNameController.text.isNotEmpty
//                 //     ? null
//                 //     : 'cannot be empty',
//               ),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter a value';
//                 }

//                 return null;
//               },
//               textInputAction: TextInputAction.next,
//               // onChanged: (value) {
//               //   setState(() {});
//               // },
//             ),
//             TextFormField(
//               controller: ingredientUnitController,
//               decoration: InputDecoration(
//                 labelText: 'Unit',
//               ),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter an Unit';
//                 }
//                 if (!value.contains('gram') &&
//                     !value.contains('piece') &&
//                     !value.contains('can') &&
//                     !value.contains('ml')) {
//                   return 'Please enter "gram", "piece", "can" or "ml"';
//                 }
//                 return null;
//               },
//               textInputAction: TextInputAction.next,
//             ),
//             TextFormField(
//               controller: ingredientAmountController,
//               decoration: InputDecoration(labelText: 'Amount'),
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter an amount';
//                 }
//                 if (int.tryParse(value) == null) {
//                   return 'Please enter a valid number';
//                 }
//                 if (int.parse(value) <= 0) {
//                   return 'Please enter a number greater than zero';
//                 }
//                 return null;
//               },
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             RaisedButton(
//               onPressed: _saveForm,
//               child: Text('Add Ingredient to Recipe'),
//               color: Theme.of(context).accentColor,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
