import 'package:flutter/material.dart';
import 'package:groceries_app/widgets/add_recipe.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Default', type: AddRecipeScreen)
Widget addRecipeScreenStory(BuildContext context) {
  return AddRecipeScreen();
}

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
