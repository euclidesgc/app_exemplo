part of 'fruit_details_cubit.dart';

sealed class FruitDetailsState extends Equatable {
  const FruitDetailsState();

  @override
  List<Object> get props => [];
}

final class FruitDetailsLoading extends FruitDetailsState {}

final class FruitDetailsLoaded extends FruitDetailsState {
  final Fruit fruit;

  const FruitDetailsLoaded({required this.fruit});

  @override
  List<Object> get props => [fruit];
}

final class FruitDetailsError extends FruitDetailsState {
  final String message;

  const FruitDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
