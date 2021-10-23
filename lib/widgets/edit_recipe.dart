import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';

class EditRecipe extends StatefulWidget {
  final Recipe recipe;

  const EditRecipe({Key? key, required this.recipe}) : super(key: key);

  @override
  _EditRecipeState createState() => _EditRecipeState();
}

class _EditRecipeState extends State<EditRecipe> {
  final _form = GlobalKey<FormState>();
  late TextEditingController nameController;
  String? title;

  var _isLoading = false;

  @override
  void initState() {
    title = widget.recipe.title;
    nameController = TextEditingController(
      text: title,
    );
    super.initState();
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
                      controller:
                          TextEditingController(text: '${widget.recipe.title}'),
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
                      onPressed: () {},
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
