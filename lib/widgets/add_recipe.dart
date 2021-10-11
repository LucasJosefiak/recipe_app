import 'package:flutter/material.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

import 'buttons/save_button.dart';

class AddRecipe extends StatefulWidget {
  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _form = GlobalKey<FormState>();

  String? title;

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

    await Provider.of<RecipesProvider>(
      context,
      listen: false,
    ).addRecipeByTitle(title!);

    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
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
                        labelText: 'Recipe',
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
                        title = value;
                      },
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
