import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/add_recipe.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';

class AddRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      appBar: AppBar(
        title: Text('New Recipe'),
      ),
      body: AddRecipe(),
    );
  }
}
