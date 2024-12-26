import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoRegisterDto {
  final String? classname;
    final int? id;
    final String? name;
    final String? email;
    final String? password;
    final String? registered;
    final int? coUserId;
  CoRegisterDto({
    this.classname,
    this.id,
    this.name,
    this.email,
    this.password,
    this.registered,
    this.coUserId,
  });

  @override
  bool operator ==(covariant CoRegisterDto other) {
    if (identical(this, other)) return true;
  
    return 
      other.classname == classname &&
      other.id == id &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.registered == registered &&
      other.coUserId == coUserId;
  }

  @override
  int get hashCode {
    return classname.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      registered.hashCode ^
      coUserId.hashCode;
  }

  @override
  String toString() {
    return 'CoRegisterDto(classname: $classname, id: $id, name: $name, email: $email, password: $password, registered: $registered, coUserId: $coUserId)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'registered': registered,
      'coUserId': coUserId,
    };
  }

  factory CoRegisterDto.fromMap(Map<String, dynamic> map) {
    return CoRegisterDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      registered: map['registered'] != null ? map['registered'] as String : null,
      coUserId: map['coUserId'] != null ? map['coUserId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoRegisterDto.fromJson(String source) => CoRegisterDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
