import 'package:flutter/material.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/screens/edit_recipe_screen.dart';
import 'package:groceries_app/widgets/ingredients_list.dart';
import 'package:provider/provider.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const routeName = '/recipe-details-screen';

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context).settings.arguments
        as String; //it will give us the id
    final loadedRecipe =
        Provider.of<RecipesProvider>(context, listen: false).findById(recipeId);
    //first recipe that matches the passed id (recipeId) will be shown (see recipes_provider.dart)
    //listen: false tells Flutter not to rebuild this widget when the data in the provider changes
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedRecipe.title,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  EditRecipeScreen.routeName,
                  arguments: loadedRecipe.id,
                );
              }),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       Provider.of<ShoppingListProvider>(context, listen: false)
      //           .addIngredientToShoppingCart(
      //         ingredientId: loadedRecipe.ingredients[index].id,
      //         amount: loadedRecipe.ingredients[index].amount,
      //         unit: loadedRecipe.ingredients[index].unit,
      //         name: loadedRecipe.ingredients[index].name,
      //       );
      //     },
      //     child: Icon(Icons.shopping_cart),
      //     backgroundColor: Theme.of(context).accentColor),
      body: IngredientsList(),
    );
  }
}
