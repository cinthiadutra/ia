import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoValidationDTO {
     final String? classname;
    final String? entityId;
    final int? type;
    final String? validation;
  CoValidationDTO({
    this.classname,
    this.entityId,
    this.type,
    this.validation,
  });


  @override
  String toString() {
    return 'CoValidationDTO(classname: $classname, entityId: $entityId, type: $type, validation: $validation)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': "CoValidationDTO",
      'entityId': entityId,
      'type': type,
      'validation': validation,
    };
  }

  factory CoValidationDTO.fromMap(Map<String, dynamic> map) {
    return CoValidationDTO(
      classname: map['classname'] != null ? map['classname'] as String : null,
      entityId: map['entityId'] != null ? map['entityId'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      validation: map['validation'] != null ? map['validation'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoValidationDTO.fromJson(String source) => CoValidationDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
