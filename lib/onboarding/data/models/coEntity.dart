import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

abstract class CoClass{}

class CoEntity extends CoClass {
final int? id;
  CoEntity({
    this.id,
  });

  

  @override
  String toString() => 'CoEntityDTO(id: $id)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory CoEntity.fromMap(Map<String, dynamic> map) {
    return CoEntity(
      id: map['id'] != null ? map['id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoEntity.fromJson(String source) => CoEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
