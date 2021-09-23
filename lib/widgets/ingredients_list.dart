import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
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
    final cart = Provider.of<ShoppingListProvider>(context, listen: false);

    return ListView.builder(
        itemCount: widget.recipe.ingredients.length,
        itemBuilder: (context, index) {
          Ingredient ingredient = widget.recipe.ingredients[index];
          return ListTile(
            title: Text(ingredient.name),
            leading: Stack(
              children: <Widget>[
                FlatButton(
                  child: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    cart.addIngredientToShoppingCart(ingredient: ingredient);
                    setState(() {
                      // loadedRecipe.ingredients[index].timesChosen += 1;
                    });
                    Scaffold.of(context).hideCurrentSnackBar();
                    Scaffold.of(context).showSnackBar(
                      //Scaffold.of(context) refers to the nearest Scaffold (here: RecipeDetailsScreen)
                      SnackBar(
                          content: Text('Added item to Shopping List!'),
                          duration: Duration(seconds: 2),
                          action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
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
                    child: Text('test'
                        // loadedRecipe.ingredients[index].timesChosen.toString(),
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
