import 'package:flutter/material.dart';
import 'package:groceries_app/providers/recipes_provider.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class IngredientsList extends StatefulWidget {
  @override
  _IngredientsListState createState() => _IngredientsListState();
}

class _IngredientsListState extends State<IngredientsList> {
  @override
  Widget build(BuildContext context) {
    return Text('List of Ingredients');
//     final recipeId = ModalRoute.of(context).settings.arguments
//         as String;
//     final loadedRecipe =
//         Provider.of<RecipesProvider>(context, listen: false).findById(recipeId);

//     final cart = Provider.of<ShoppingListProvider>(context, listen: false);

//     return ListView.builder(
//         // itemCount: loadedRecipe.ingredients.length,
//         itemBuilder: (context, index) {
//       return ListTile(
//         // title: Text(loadedRecipe.ingredients[index].name),
//         subtitle: Text('test'
//             // '${loadedRecipe.ingredients[index].amount}${loadedRecipe.ingredients[index].unit}',
//             ),
//         leading: Stack(
//           children: <Widget>[
//             FlatButton(
//               child: Icon(
//                 Icons.shopping_cart,
//                 // color: loadedRecipe.ingredients[index].timesChosen > 0
//                 // ? Colors.amber
//                 // : Colors.black54,
//               ),
//               onPressed: () {
//                 cart.addIngredientToShoppingCart(
//                     // ingredientId: loadedRecipe.ingredients[index].id,
//                     // amount: loadedRecipe.ingredients[index].amount,
//                     // unit: loadedRecipe.ingredients[index].unit.toString(),
//                     // name: loadedRecipe.ingredients[index].name,
//                     );
//                 setState(() {
//                   // loadedRecipe.ingredients[index].timesChosen += 1;
//                 });
//                 Scaffold.of(context).hideCurrentSnackBar();
//                 Scaffold.of(context).showSnackBar(
//                   //Scaffold.of(context) refers to the nearest Scaffold (here: RecipeDetailsScreen)
//                   SnackBar(
//                       content: Text('Added item to Shopping List!'),
//                       duration: Duration(seconds: 2),
//                       action: SnackBarAction(
//                         label: 'UNDO',
//                         onPressed: () {
//                           setState(() {
//                             // cart.deleteIngredientFromShoppingCart(
//                             //   ingredientId:
//                             //       loadedRecipe.ingredients[index].id,
//                             //   amount:
//                             //       loadedRecipe.ingredients[index].amount,
//                             //   unit: loadedRecipe.ingredients[index].unit
//                             //       .toString(),
//                             //   name: loadedRecipe.ingredients[index].name,
//                             // );
//                             // loadedRecipe.ingredients[index].timesChosen -=
//                             //     1;
//                           });
//                         },
//                       )),
//                 );
//               },
//             ),
//             Positioned(
//               top: 3,
//               right: 20,
//               child: Center(
//                 child: Text('test'
//                     // loadedRecipe.ingredients[index].timesChosen.toString(),
//                     ),
//               ),
//             ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: Icon(
//             Icons.delete,
//           ),
//           onPressed: () {
//             setState(() {
//               // cart.deleteIngredientFromShoppingCart(
//               //   ingredientId: loadedRecipe.ingredients[index].id,
//               //   amount: loadedRecipe.ingredients[index].amount,
//               //   unit: loadedRecipe.ingredients[index].unit.toString(),
//               //   name: loadedRecipe.ingredients[index].name,
//               // );
//               // loadedRecipe.ingredients[index].timesChosen -= 1;
//             });
//           },
//         ),
//       );
//     });
//   }
  }
}
