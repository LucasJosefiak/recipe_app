import 'package:groceries_app/models/recipe.dart';
import 'package:groceries_app/repositories/database_repository.dart';

class RecipeRepository extends DatabaseRepository<Recipe> {
  static final String collectionName = 'recipes';
  RecipeRepository() : super(collectionName);
}
