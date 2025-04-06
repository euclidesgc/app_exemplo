import 'package:example/modules/fruit_module/data/fruit_repository.dart';
import 'package:example/modules/fruit_module/domain/entities/fruit.dart';

class GetFruitByIdUseCase {
  final FruitRepository repository;

  GetFruitByIdUseCase({required this.repository});

  Future<Fruit> call({required int id}) async {
    final mapEntity = await repository.getFruitById(id);

    final fruit = Fruit.fromMap(mapEntity);

    return fruit;
  }
}
