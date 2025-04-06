import 'package:example/modules/animals_module/data/animals_repository.dart';
import 'package:example/modules/animals_module/domain/entities/animal_entity.dart';

class GetAnimalByIdUseCase {
  final AnimalsRepository repository;

  GetAnimalByIdUseCase({required this.repository});

  Future<AnimalEntity> call({required int id}) async {
    final mapEntity = await repository.getAnimalById(id);

    final animalEntity = AnimalEntity.fromMap(mapEntity);

    return animalEntity;
  }
}
