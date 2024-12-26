import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginModel {
  final String username;
  final String password;

  LoginModel({
    required this.username,
    required this.password,
  });



  @override
  String toString() => 'LoginModel(username: $username, password: $password)';

  LoginModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
