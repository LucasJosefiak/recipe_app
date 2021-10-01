import 'package:flutter/material.dart';
import 'package:groceries_app/models/arguments/edit_ingredient_argument.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/screens/edit_ingredient_screen.dart';
import 'package:provider/provider.dart';

class IngredientsList extends StatefulWidget {
  final Recipe recipe;

  const IngredientsList({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
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

    return ListView.builder(
        itemCount: widget.recipe.ingredients.length,
        itemBuilder: (context, index) {
          Ingredient ingredient = widget.recipe.ingredients[index];
          return ListTile(
            title: TextButton(
              child: Text(ingredient.name),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  EditIngredientScreen.routeName,
                  arguments: EditIngredientArgument(
                    recipe: widget.recipe,
                    ingredient: ingredient,
                  ),
                );
              },
            ),
            leading: Stack(
              children: <Widget>[
                TextButton(
                  child: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    cart.addIngredientToShoppingCart(ingredient: ingredient);
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
                                  ingredient: ingredient);
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
                      ingredient.timesChosen.toString(),
                    ),
                  ),
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                recipesProvider.deleteIngredient(
                  recipe: widget.recipe,
                  ingredient: ingredient,
                );
                cart.deleteIngredientFromShoppingCart(ingredient: ingredient);
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
          );
        });
  }
}
