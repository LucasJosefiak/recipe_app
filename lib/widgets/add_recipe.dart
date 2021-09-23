import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/widgets/error_dialog.dart';
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
    try {
      await Provider.of<RecipesProvider>(context, listen: false).addRecipe(
        Recipe(
          title: title!,
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
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).accentColor),
                      ),
                      child: Text('Save'),
                      onPressed: _saveForm,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
