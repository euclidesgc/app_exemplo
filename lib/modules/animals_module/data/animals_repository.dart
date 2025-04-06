import '../domain/entities/animal_entity.dart';

class AnimalsRepository {
  final List<AnimalEntity> _animals = [
    AnimalEntity(id: 1, name: 'Leão', description: 'Rei da selva'),
    AnimalEntity(
      id: 2,
      name: 'Elefante',
      description: 'Maior animal terrestre',
    ),
    AnimalEntity(
      id: 3,
      name: 'Girafa',
      description: 'Animal de pescoço comprido',
    ),
  ];

  Future<List<Map<String, dynamic>>> getAllAnimals() async {
    await Future.delayed(const Duration(seconds: 2));
    return _animals.toList().map((animal) => animal.toMap()).toList();
  }

  Future<Map<String, dynamic>> getAnimalById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    return _animals
        .firstWhere(
          (animal) => animal.id == id,
          orElse: () => throw Exception('Animal not found'),
        )
        .toMap();
  }
}
