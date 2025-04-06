import 'dart:convert';

import 'package:equatable/equatable.dart';

class Fruit extends Equatable {
  final int id;
  final String name;
  final String description;

  const Fruit({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object> get props => [id, name, description];

  Fruit copyWith({int? id, String? name, String? description}) {
    return Fruit(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Fruit.fromJson(String source) => Fruit.fromMap(json.decode(source));

  @override
  String toString() => 'Fruit(id: $id, name: $name, description: $description)';
}
