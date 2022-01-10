import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/models/shopping_list_ingredient.dart';
import 'package:groceries_app/repositories/database_repository.dart';

class ShoppingListRepository
    extends DatabaseRepository<ShoppingListIngredient> {
  static final String collectionName = 'shopping-list-items';
  ShoppingListRepository() : super(collectionName);
}
