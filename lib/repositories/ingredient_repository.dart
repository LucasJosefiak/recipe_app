import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/repositories/database_repository.dart';

class IngredientRepository extends DatabaseRepository<Ingredient> {
  IngredientRepository() : super('ingredients');
}
