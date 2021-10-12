import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/unit_provider.dart';
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
  final _form = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController amountController;
  String? name;
  int? amount;
  Unit? unit;

  var _isLoading = false;

  @override
  void initState() {
    name = widget.ingredientAmount.ingredient.name;
    amount = widget.ingredientAmount.amount;
    unit = widget.ingredientAmount.ingredient.unit;

    nameController = TextEditingController(
      text: name,
    );
    amountController = TextEditingController(text: amount.toString());

    super.initState();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
      //if the Form is not valid, the form will not be safed. Code will then
      //stop after return and thus before the form could be saved
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    // TODO put this back in
    // await Provider.of<RecipesProvider>(context, listen: false).updateIngredientOfRecipe(
    //   recipe: widget.recipe,
    //   ingredient: widget.ingredientAmount.copyWith(
    //     name: name!,
    //     amount: amount!,
    //     unit: unit!,
    //   ),
    // );

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var units = Provider.of<UnitProvider>(context).units;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Ingredient',
                      ),
                      controller: TextEditingController(
                          text: '${widget.ingredientAmount.ingredient.name}'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Please provide a value.';
                        }
                        return null;
                        // null means no error (coorect Form)
                      },
                      onSaved: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DropdownSearch<Unit>(
                      hint: 'Select an unit',
                      items: units,
                      selectedItem: unit,
                      itemAsString: (Unit unit) => unit.name,
                      onChanged: (value) {
                        unit = value;
                      },
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
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                      onSaved: (value) {
                        if (value != null) {
                          var intValue = int.parse(value);
                          amount = intValue;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SaveButton(
                      function: _saveForm,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
