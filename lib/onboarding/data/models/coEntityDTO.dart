// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, file_names


import 'dart:convert';

import 'package:bkopen/onboarding/data/models/coEntity.dart';



class CoEntityDTO extends CoEntity {
@override
  final int? id;
  final String classname;
  CoEntityDTO({
    this.id,
    required this.classname,
  }):super(id: id);


  

  @override
  String toString() => 'CoEntityDTO(id: $id, classname: $classname)';

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classname': classname,
    };
  }

  factory CoEntityDTO.fromMap(Map<String, dynamic> map) {
    return CoEntityDTO(
      id: map['id'] != null ? map['id'] as int : null,
      classname: map['classname'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory CoEntityDTO.fromJson(String source) => CoEntityDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
