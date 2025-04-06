import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/fruit.dart';
import '../../../domain/use_cases/get_all_fruits_use_case.dart';

part 'fruit_list_state.dart';

class FruitListCubit extends Cubit<FruitListState> {
  GetAllFruitsUseCase usecase;

  FruitListCubit({required this.usecase}) : super(FruitLoading());

  Future<void> getAllFruits() async {
    try {
      emit(FruitLoading());
      final fruits = await usecase.call();
      emit(FruitLoaded(fruits: fruits));
    } catch (e) {
      emit(FruitError(message: e.toString()));
    }
  }
}
