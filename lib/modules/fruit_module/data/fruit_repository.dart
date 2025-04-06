import '../domain/entities/fruit.dart';

class FruitRepository {
  final List<Fruit> _fruits = [
    Fruit(id: 1, name: 'Maçã', description: 'Fruta vermelha e crocante'),
    Fruit(id: 2, name: 'Banana', description: 'Fruta amarela, doce e macia'),
    Fruit(id: 3, name: 'Laranja', description: 'Fruta cítrica e refrescante'),
  ];

  Future<List<Map<String, dynamic>>> getAllAnimals() async {
    await Future.delayed(const Duration(seconds: 2));
    return _fruits.toList().map((fruit) => fruit.toMap()).toList();
  }

  Future<Map<String, dynamic>> getFruitById(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    return _fruits
        .firstWhere(
          (fruit) => fruit.id == id,
          orElse: () => throw Exception('Fruit not found'),
        )
        .toMap();
  }
}
