import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class AddIngredient extends StatefulWidget {
  final Recipe recipe;

  const AddIngredient({Key? key, required this.recipe}) : super(key: key);

  @override
  _AddIngredientState createState() => _AddIngredientState();
}

class _AddIngredientState extends State<AddIngredient> {
  final _form = GlobalKey<FormState>();

  String? name;
  Unit? unit;
  int? amount;

  var _isLoading = false;

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
    try {
      await Provider.of<RecipesProvider>(context, listen: false).addIngredient(
        widget.recipe,
        Ingredient(
          name: name!,
          amount: amount!,
          unit: unit!,
          createdAt: DateTime.now(),
        ),
      );
    } catch (error) {
      await showDialog<Null>(
        context: context,
        builder: (ctx) => ErrorDialog(),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      items: Unit.values,
                      selectedItem: unit,
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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor),
                      ),
                      child: Text('Add to ${widget.recipe.title}'),
                      onPressed: _saveForm,
                    ),
                  ],
                ),
              ),
            ),
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
