import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginResponse {
  final String token;
  final String expiry;

  LoginResponse({
    required this.token,
    required this.expiry,
  });

  

  @override
  String toString() => 'LoginResponse(token: $token, expiry: $expiry)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'expiry': expiry,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['token'] as String,
      expiry: map['expiry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  LoginResponse copyWith({
    String? token,
    String? expiry,
  }) {
    return LoginResponse(
      token: token ?? this.token,
      expiry: expiry ?? this.expiry,
    );
  }
}
