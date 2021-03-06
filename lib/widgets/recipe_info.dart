import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/screens/recipe_details_screen.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: RecipeInfo)
Widget defaultStory(BuildContext context) {
  return Column(
    children: [
      RecipeInfo(
        recipe: Recipe(
          identifier: '1',
          title: 'Tomato Lasagna',
          createdAt: DateTime.now(),
        ),
      ),
    ],
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
    return SizedBox(
      child: GestureDetector(
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
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  BlocProvider.of<ShoppingListCubit>(
                    context,
                    listen: false,
                  ).addRecipe(recipe);
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                ),
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
