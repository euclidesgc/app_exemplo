import 'package:example/modules/fruit_module/data/fruit_repository.dart';
import 'package:example/modules/fruit_module/domain/entities/fruit.dart';

class GetAllFruitsUseCase {
  final FruitRepository repository;

  GetAllFruitsUseCase({required this.repository});

  Future<List<Fruit>> call() async {
    final mapEntities = await repository.getAllAnimals();

    final List<Fruit> fruits =
        mapEntities.map((fruit) {
          return Fruit.fromMap(fruit);
        }).toList();

    return fruits;
  }
}
