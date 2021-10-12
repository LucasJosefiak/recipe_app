import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:provider/provider.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    List<Ingredient> shoppingListIngredients =
        Provider.of<ShoppingListProvider>(context)
            .ingredientsInShoppingList
            .values
            .toList();
    return Container();
    // return ListView.builder(
    //   itemCount: shoppingListIngredients.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(shoppingListIngredients[index].name),
    //       subtitle: Text(
    //         '${shoppingListIngredients[index].amount}\ ${shoppingListIngredients[index].unit.name}',
    //       ),
    //       leading: Checkbox(
    //         value: shoppingListIngredients[index].isChosen,
    //         onChanged: (value) {
    //           setState(() {
    //             // shoppingListIngredients[index].isChosen =
    //             !shoppingListIngredients[index].isChosen;
    //           });
    //         },
    //       ),
    //     );
    //   },
    // );
  }
}
