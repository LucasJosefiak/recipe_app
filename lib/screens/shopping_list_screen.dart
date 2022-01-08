import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries_app/cubit/shopping_list_cubit.dart';
import 'package:groceries_app/repositories/shopping_list_repository.dart';
import 'package:groceries_app/widgets/common/padded_scaffold.dart';
import 'package:groceries_app/widgets/shopping_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Default', type: ShoppingListScreen)
Widget shoppingListScreen(BuildContext context) {
  return MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ShoppingListRepository(),
      )
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShoppingListCubit(
            shoppingListRepository:
                RepositoryProvider.of<ShoppingListRepository>(context),
          ),
        ),
      ],
      child: ShoppingListScreen(),
    ),
  );
}

class ShoppingListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaddedScaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          BlocProvider.of<ShoppingListCubit>(
            context,
            listen: false,
          ).clearCart();
        },
        label: Text('Clear'),
        icon: Icon(Icons.shopping_cart),
      ),
      body: ShoppingList(),
    );
  }
}
