part of 'fruit_list_cubit.dart';

sealed class FruitListState extends Equatable {
  const FruitListState();

  @override
  List<Object> get props => [];
}

final class FruitLoading extends FruitListState {}

final class FruitLoaded extends FruitListState {
  final List<Fruit> fruits;

  const FruitLoaded({required this.fruits});

  @override
  List<Object> get props => [fruits];
}

final class FruitError extends FruitListState {
  final String message;

  const FruitError({required this.message});

  @override
  List<Object> get props => [message];
}
