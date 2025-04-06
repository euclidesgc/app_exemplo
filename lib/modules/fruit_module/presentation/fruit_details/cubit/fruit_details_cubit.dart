import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:example/modules/fruit_module/domain/entities/fruit.dart';
import 'package:example/modules/fruit_module/domain/use_cases/get_fruit_by_id_use_case.dart';

part 'fruit_details_state.dart';

class FruitDetailsCubit extends Cubit<FruitDetailsState> {
  final GetFruitByIdUseCase usecase;

  FruitDetailsCubit({required this.usecase}) : super(FruitDetailsLoading());

  Future<void> getFruitDetails(int fruitId) async {
    try {
      emit(FruitDetailsLoading());
      final fruit = await usecase.call(id: fruitId);

      emit(FruitDetailsLoaded(fruit: fruit));
    } catch (e) {
      emit(FruitDetailsError(message: e.toString()));
    }
  }
}
