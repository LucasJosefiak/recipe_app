import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/widgets/common/padded_card.dart';
import 'package:groceries_app/widgets/common/separated_list_view.dart';
import 'package:groceries_app/widgets/tile_title.dart';
import 'package:groceries_app/widgets/tile_unit.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    final ingredients = BlocProvider.of<ShoppingListCubit>(
      context,
      listen: true,
    ).state.ingredients.entries.toList();
    return SeparatedListView(
      itemBuilder: (context, index) {
        var entry = ingredients[index];
        return PaddedCard(
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
        );
      },
      itemCount: ingredients.length,
    );
  }
}
