import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';

class IngredientOverview extends StatefulWidget {
  final Ingredient ingredient;
  const IngredientOverview({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  State<IngredientOverview> createState() => _IngredientOverviewState();
}

class _IngredientOverviewState extends State<IngredientOverview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.ingredient.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Unit: ${widget.ingredient.unit.fullSymbol}',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
