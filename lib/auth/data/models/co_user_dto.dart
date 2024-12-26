import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoUserDtoRequest {
  final String? id;
  final String? classname;
  final String? password;
  CoUserDtoRequest({
    this.id,
    this.classname,
    this.password,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classname': classname,
      'password': password,
    };
  }

  factory CoUserDtoRequest.fromMap(Map<String, dynamic> map) {
    return CoUserDtoRequest(
      id: map['id'] != null ? map['id'] as String : null,
      classname: map['classname'] != null ? map['classname'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoUserDtoRequest.fromJson(String source) => CoUserDtoRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CoUserDtoRequest(id: $id, classname: $classname, password: $password)';
}
