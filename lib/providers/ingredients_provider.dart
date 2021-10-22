import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/loading_state.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/repositories/repository.dart';
import 'package:groceries_app/services/id_service.dart';
import 'package:groceries_app/services/time_service.dart';

class IngredientsProvider with ChangeNotifier {
  IngredientsProvider({
    required this.ingredientRepository,
    IdService? idService,
    TimeService? timeService,
  })  : idService = idService ?? IdService(),
        timeService = timeService ?? TimeService();

  final Repository<Ingredient> ingredientRepository;
  final IdService idService;
  final TimeService timeService;

  List<Ingredient> ingredients = [];
  LoadingState loadingState = LoadingState.uninitialized;

  Ingredient addIngredient({
    required String name,
    required Unit unit,
  }) {
    var ingredientsWithName =
        ingredients.where((element) => element.name == name);
    if (ingredientsWithName.isEmpty) {
      return ingredientRepository.addItem(
        Ingredient(
          identifier: idService.getId(),
          unit: unit,
          name: name,
          createdAt: timeService.getNow(),
        ),
      );
    }
    return ingredientsWithName.first;
  }

  void deleteIngredient(Ingredient ingredient) {
    ingredientRepository.deleteItem(ingredient);
  }

  void updateIngredient(Ingredient ingredient) {
    throw ArgumentError('Do not use for now');
    // ingredientRepository.updateItem(ingredient);
  }

  Future<void> load() async {
    ingredientRepository.getStreamOfItems().forEach((ingredients) {
      this.ingredients = ingredients;
      loadingState = LoadingState.loaded;
      notifyListeners();
    });
  }
}
