import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RegisterModel {
  final String classname;
  final String email;
  final String password;
  final String name;
  RegisterModel({
     this.classname = "CoRegisterDTO",
    required this.email,
    required this.password,
    required this.name,
  });


  @override
  String toString() {
    return 'RegisterModel(classname: $classname, email: $email, password: $password, name: $name)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'email': email,
      'password': password,
      'name': name,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      classname: map['classname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
