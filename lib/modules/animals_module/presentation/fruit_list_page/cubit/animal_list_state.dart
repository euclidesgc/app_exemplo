part of 'animal_list_cubit.dart';

sealed class AnimalListState extends Equatable {
  const AnimalListState();

  @override
  List<Object> get props => [];
}

final class AnimalLoading extends AnimalListState {}

final class AnimalLoaded extends AnimalListState {
  final List<AnimalEntity> animals;

  const AnimalLoaded({required this.animals});

  @override
  List<Object> get props => [animals];
}

final class AnimalError extends AnimalListState {
  final String message;

  const AnimalError({required this.message});

  @override
  List<Object> get props => [message];
}
