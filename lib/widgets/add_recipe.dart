import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/recipes_cubit.dart';
import 'package:groceries_app/widgets/common/text_field_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

    await BlocProvider.of<RecipesCubit>(
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
                    label: AppLocalizations.of(context)!.nameRecipe,
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
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _saveForm();
                    },
                    child: Text(AppLocalizations.of(context)!.save),
                  )
                ],
              ),
            ),
          );
  }
}
