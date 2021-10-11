import 'package:flutter/material.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/widgets/tile_title.dart';

class RecipeInfo extends StatelessWidget {
  final Recipe recipe;
  const RecipeInfo({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RecipeDetailsScreen.routeName,
            arguments: recipe);
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              TileTitle(
                title: recipe.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
