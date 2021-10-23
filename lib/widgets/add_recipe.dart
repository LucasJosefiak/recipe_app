import 'package:flutter/material.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/common/text_field_helper.dart';
import 'package:provider/provider.dart';

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
    ).addRecipe(title!);

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
        : Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFieldHelper.buildTextField(
                    label: 'name',
                    hintText: 'potatoe soup',
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Please provide a value.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      title = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _saveForm();
                    },
                    child: Text('Save'),
                  )
                ],
              ),
            ),
          );
  }
}
