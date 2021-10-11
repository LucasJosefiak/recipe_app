import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/model.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe extends Model with _$Recipe {
  @Implements(Model)
  factory Recipe({
    required String id,
    required String title,
    required DateTime createdAt,
    @Default(const <Ingredient>[]) List<Ingredient> ingredients,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
