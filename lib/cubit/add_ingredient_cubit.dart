import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groceries_app/models/ingredient.dart';
import 'package:groceries_app/models/unit.dart';
import 'package:groceries_app/repositories/repository.dart';

part 'add_ingredient_state.dart';

class AddIngredientCubit extends Cubit<AddIngredientState> {
  AddIngredientCubit({
    required this.ingredientRepository,
  }) : super(
          AddIngredientState(),
        );

  final Repository<Ingredient> ingredientRepository;

  void nameChanged(String? name) {
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void unitChanged(Unit? unit) {
    emit(
      state.copyWith(
        unit: unit,
      ),
    );
  }

  void amountChanged(String? amount) {
    if (amount == null) {
      return;
    }
    var number = int.tryParse(amount);
    if (number != null) {
      emit(
        state.copyWith(
          amount: number,
        ),
      );
    } else {}
  }

  void ingredientChanged(Ingredient ingredient) {
    emit(
      state.copyWith(
        name: ingredient.name,
        unit: ingredient.unit,
        ingredient: ingredient,
      ),
    );
  }

  void submit() {}
}
