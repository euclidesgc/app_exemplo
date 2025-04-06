part of 'animals_details_cubit.dart';

sealed class AnimalsDetailsState extends Equatable {
  const AnimalsDetailsState();

  @override
  List<Object> get props => [];
}

final class AnimalDetailsLoading extends AnimalsDetailsState {}

final class AnimalDetailsLoaded extends AnimalsDetailsState {
  final AnimalEntity animal;

  const AnimalDetailsLoaded({required this.animal});

  @override
  List<Object> get props => [animal];
}

final class AnimalDetailsError extends AnimalsDetailsState {
  final String message;

  const AnimalDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
