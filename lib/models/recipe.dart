import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:groceries_app/models/ingredient.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
//TODO what does "@freezed" mean?
class Recipe with _$Recipe {
  //TODO what does "$" stand for?
  factory Recipe({
    //TODO what does "factory" mean?
    String? id,
    required String title,
    required DateTime createdAt,
    @Default(const <Ingredient>[]) List<Ingredient> ingredients,
    //TODO what does "@Default" mean?
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  //TODO what does that line of code mean?
}
