import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/modules/animals_module/domain/entities/animal_entity.dart';

import '../../../domain/use_cases/get_animal_by_id_use_case.dart';

part 'animals_details_state.dart';

class AnimalsDetailsCubit extends Cubit<AnimalsDetailsState> {
  final GetAnimalByIdUseCase usecase;

  AnimalsDetailsCubit({required this.usecase}) : super(AnimalDetailsLoading());

  Future<void> getAnimalsDetails(int animalId) async {
    try {
      emit(AnimalDetailsLoading());
      final animal = await usecase.call(id: animalId);

      emit(AnimalDetailsLoaded(animal: animal));
    } catch (e) {
      emit(AnimalDetailsError(message: e.toString()));
    }
  }
}
