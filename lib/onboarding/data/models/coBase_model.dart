// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoBaseModel {
  final String classname;
  final String? toNumber;
  CoBaseModel({
   this.classname = 'CoBaseModel',
    this.toNumber,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'toNumber': toNumber,
    };
  }

  factory CoBaseModel.fromMap(Map<String, dynamic> map) {
    return CoBaseModel(
      classname: map['classname'] as String,
      toNumber: map['toNumber'] != null ? map['toNumber'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoBaseModel.fromJson(String source) => CoBaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CoBaseModel(classname: $classname, toNumber: $toNumber)';
}
