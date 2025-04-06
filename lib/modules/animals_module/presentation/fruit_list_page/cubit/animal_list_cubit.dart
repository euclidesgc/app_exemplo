import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/modules/animals_module/domain/entities/animal_entity.dart';

import '../../../domain/use_cases/get_all_animals_use_case.dart';

part 'animal_list_state.dart';

class AnimalListCubit extends Cubit<AnimalListState> {
  GetAllAnimalsUseCase usecase;

  AnimalListCubit({required this.usecase}) : super(AnimalLoading());

  Future<void> getAllAnimals() async {
    try {
      emit(AnimalLoading());
      final animals = await usecase.call();
      emit(AnimalLoaded(animals: animals));
    } catch (e) {
      emit(AnimalError(message: e.toString()));
    }
  }
}
