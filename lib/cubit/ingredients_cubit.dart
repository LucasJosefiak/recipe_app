import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ingredients_state.dart';

class IngredientsCubit extends Cubit<IngredientsState> {
  IngredientsCubit() : super(IngredientsInitial());
}
