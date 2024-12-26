// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoSMSMessageDTO {
  final String? classname;
  final String? toNumber;
  final String? id;
  final String? textContent;
  CoSMSMessageDTO({
    this.classname,
    this.toNumber,
    this.id,
    this.textContent,
  });

  @override
  String toString() {
    return 'CoSMSMessageDTO(classname: $classname, toNumber: $toNumber, id: $id, textContent: $textContent)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'toNumber': toNumber,
      'id': id,
      'textContent': textContent,
    };
  }

  factory CoSMSMessageDTO.fromMap(Map<String, dynamic> map) {
    return CoSMSMessageDTO(
      classname: map['classname'] != null ? map['classname'] as String : null,
      toNumber: map['toNumber'] != null ? map['toNumber'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      textContent: map['textContent'] != null ? map['textContent'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoSMSMessageDTO.fromJson(String source) => CoSMSMessageDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
