import 'package:flutter/material.dart';
import 'package:groceries_app/constants/colors.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:provider/provider.dart';

class RecipeOverview extends StatefulWidget {
  final Recipe recipe;
  const RecipeOverview({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeOverview> createState() => _RecipeOverviewState();
}

class _RecipeOverviewState extends State<RecipeOverview> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(
      text: widget.recipe.title,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditableText(
              backgroundCursorColor: ColorConstants.grey,
              onChanged: (value) {
                Provider.of<RecipesProvider>(
                  context,
                  listen: false,
                ).updateRecipe(
                  widget.recipe.copyWith(
                    title: value,
                  ),
                );
              },
              controller: controller,
              cursorColor: ColorConstants.green,
              focusNode: FocusNode(),
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text('${widget.recipe.ingredients.length} ingredients')
          ],
        ),
      ),
    );
  }
}
