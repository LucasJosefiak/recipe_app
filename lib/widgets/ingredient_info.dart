import 'package:flutter/material.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/providers/unit_provider.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:groceries_app/widgets/buttons/custom_icon_button.dart';
import 'package:provider/src/provider.dart';

import 'custom_card.dart';

class IngredientInfo extends StatefulWidget {
  final Ingredient ingredient;
  final Recipe recipe;
  const IngredientInfo(
      {Key? key, required this.ingredient, required this.recipe})
      : super(key: key);

  @override
  State<IngredientInfo> createState() => _IngredientInfoState();
}

class _IngredientInfoState extends State<IngredientInfo> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ShoppingListProvider>(
      context,
      listen: false,
    );
    final recipesProvider = Provider.of<RecipesProvider>(
      context,
      listen: false,
    );

    var units = Provider.of<UnitProvider>(context).units;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EditIngredientScreen.routeName,
          arguments: EditIngredientArgument(
            recipe: widget.recipe,
            ingredient: widget.ingredient,
          ),
        );
      },
      child: CustomCard(
        child: Row(
          children: [
            Stack(
              children: <Widget>[
                CustomIconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  function: () {
                    cart.addIngredientToShoppingCart(
                        ingredient: widget.ingredient);
                    setState(() {
                      // cart.ingredientsInShoppingList[index]!.timesChosen += 1;
                    });
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      //Scaffold.of(context) refers to the nearest Scaffold (here: RecipeDetailsScreen)
                      SnackBar(
                          content: Text('Added item to Shopping List!'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              cart.deleteIngredientFromShoppingCart(
                                  ingredient: widget.ingredient);
                              setState(() {
                                // cart.deleteIngredientFromShoppingCart(
                                //   ingredientId:
                                //       loadedRecipe.ingredients[index].id,
                                //   amount:
                                //       loadedRecipe.ingredients[index].amount,
                                //   unit: loadedRecipe.ingredients[index].unit
                                //       .toString(),
                                //   name: loadedRecipe.ingredients[index].name,
                                // );
                                // loadedRecipe.ingredients[index].timesChosen -=
                                //     1;
                              });
                            },
                          )),
                    );
                  },
                ),
                Positioned(
                  top: 3,
                  right: 20,
                  child: Center(
                    child: Text(
                      widget.ingredient.timesChosen.toString(),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.ingredient.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.ingredient.amount.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        widget.ingredient.unit.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            CustomIconButton(
              icon: Icon(
                Icons.delete,
              ),
              function: () {
                recipesProvider.deleteIngredient(
                  recipe: widget.recipe,
                  ingredient: widget.ingredient,
                );
                cart.deleteIngredientFromShoppingCart(
                    ingredient: widget.ingredient);
                setState(() {
                  // cart.deleteIngredientFromShoppingCart(
                  //   ingredientId: loadedRecipe.ingredients[index].id,
                  //   amount: loadedRecipe.ingredients[index].amount,
                  //   unit: loadedRecipe.ingredients[index].unit.toString(),
                  //   name: loadedRecipe.ingredients[index].name,
                  // );
                  // loadedRecipe.ingredients[index].timesChosen -= 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
