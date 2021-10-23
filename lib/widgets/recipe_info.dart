import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookStory(name: 'Default', type: RecipeInfo)
Widget defaultStory(BuildContext context) {
  return RecipeInfo(
    recipe: Recipe(
      identifier: '1',
      title: 'Tomato Lasagna',
      createdAt: DateTime.now(),
    ),
  );
}

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsScreen(
              recipe: recipe,
            ),
          ),
        );
      },
      child: PaddedCard(
        child: Row(
          children: [
            TileTitle(
              title: recipe.title,
            ),
            Expanded(
              child: Container(),
            ),
            IconButton(
              onPressed: () {
                Provider.of<ShoppingListProvider>(
                  context,
                  listen: false,
                ).addRecipe(recipe);
              },
              icon: Icon(
                FontAwesomeIcons.cartPlus,
              ),
            )
          ],
        ),
      ),
    );
  }
}
