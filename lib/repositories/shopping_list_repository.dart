import 'package:groceries_app/models/ingredient_amount.dart';
import 'package:groceries_app/repositories/database_repository.dart';

class ShoppingListRepository extends DatabaseRepository<IngredientAmount> {
  static final String collectionName = 'shopping-list-items';
  ShoppingListRepository() : super(collectionName);
}
