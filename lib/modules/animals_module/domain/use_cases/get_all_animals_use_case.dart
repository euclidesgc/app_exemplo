import 'package:example/modules/animals_module/data/animals_repository.dart';
import 'package:example/modules/animals_module/domain/entities/animal_entity.dart';

class GetAllAnimalsUseCase {
  final AnimalsRepository repository;

  GetAllAnimalsUseCase({required this.repository});

  Future<List<AnimalEntity>> call() async {
    final mapEntities = await repository.getAllAnimals();

    final List<AnimalEntity> animals =
        mapEntities.map((animal) {
          return AnimalEntity.fromMap(animal);
        }).toList();

    return animals;
  }
}
