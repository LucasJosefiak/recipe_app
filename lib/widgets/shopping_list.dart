import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/providers/shopping_list_provider.dart';
import 'package:groceries_app/widgets/custom_card.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/tile_unit.dart';
import 'package:provider/provider.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    final ingredients = Provider.of<ShoppingListProvider>(
      context,
      listen: true,
    ).ingredients.entries.toList();
    return ListView.separated(
        itemBuilder: (context, index) {
          var entry = ingredients[index];
          return Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  TileTitle(
                    title: entry.key.name,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Text(
                    entry.value.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  TileUnit(
                    unit: entry.key.unit,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 8);
        },
        itemCount: ingredients.length);
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
