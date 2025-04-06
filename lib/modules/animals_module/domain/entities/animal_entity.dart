import 'dart:convert';

import 'package:equatable/equatable.dart';

class AnimalEntity extends Equatable {
  final int id;
  final String name;
  final String description;

  const AnimalEntity({
    required this.id,
    required this.name,
    required this.description,
  });

  AnimalEntity copyWith({int? id, String? name, String? description}) {
    return AnimalEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description};
  }

  factory AnimalEntity.fromMap(Map<String, dynamic> map) {
    return AnimalEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimalEntity.fromJson(String source) =>
      AnimalEntity.fromMap(json.decode(source));

  @override
  String toString() =>
      'AnimalEntitty(id: $id, name: $name, description: $description)';

  @override
  List<Object> get props => [id, name, description];
}
