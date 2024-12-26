import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoUserDto {
   String? classname;
     int? id;
     String? created;
     String? updated;
     int? couseridcre;
     int? couseridupd;
     String? username;
     String? firstName;
     String? lastName;
     String? email;
     bool? isActive;
     String? oldPassword;
     String? password;
     String? passwordConfirmation;
     String? name;
     String? nickName;
     String? birth;
     String? legalDocument;
     String? emailValidated;
     String? documentValidated;
     String? cellPhone;
     String? phoneValidated;
     int? coCultureId;
     String? viewcoCultureId;
     String? basicAuthentication;
     String? blocked;
     int? type;
  CoUserDto({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isActive,
    this.oldPassword,
    this.password,
    this.passwordConfirmation,
    this.name,
    this.nickName,
    this.birth,
    this.legalDocument,
    this.emailValidated,
    this.documentValidated,
    this.cellPhone,
    this.phoneValidated,
    this.coCultureId,
    this.viewcoCultureId,
    this.basicAuthentication,
    this.blocked,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'isActive': isActive,
      'oldPassword': oldPassword,
      'password': password,
      'passwordConfirmation': passwordConfirmation,
      'name': name,
      'nickName': nickName,
      'birth': birth,
      'legalDocument': legalDocument,
      'emailValidated': emailValidated,
      'documentValidated': documentValidated,
      'cellPhone': cellPhone,
      'phoneValidated': phoneValidated,
      'coCultureId': coCultureId,
      'viewcoCultureId': viewcoCultureId,
      'basicAuthentication': basicAuthentication,
      'blocked': blocked,
      'type': type,
    };
  }

  factory CoUserDto.fromMap(Map<String, dynamic> map) {
    return CoUserDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre: map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd: map['couseridupd'] != null ? map['couseridupd'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      oldPassword: map['oldPassword'] != null ? map['oldPassword'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      passwordConfirmation: map['passwordConfirmation'] != null ? map['passwordConfirmation'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nickName: map['nickName'] != null ? map['nickName'] as String : null,
      birth: map['birth'] != null ? map['birth'] as String : null,
      legalDocument: map['legalDocument'] != null ? map['legalDocument'] as String : null,
      emailValidated: map['emailValidated'] != null ? map['emailValidated'] as String : null,
      documentValidated: map['documentValidated'] != null ? map['documentValidated'] as String : null,
      cellPhone: map['cellPhone'] != null ? map['cellPhone'] as String : null,
      phoneValidated: map['phoneValidated'] != null ? map['phoneValidated'] as String : null,
      coCultureId: map['coCultureId'] != null ? map['coCultureId'] as int : null,
      viewcoCultureId: map['viewcoCultureId'] != null ? map['viewcoCultureId'] as String : null,
      basicAuthentication: map['basicAuthentication'] != null ? map['basicAuthentication'] as String : null,
      blocked: map['blocked'] != null ? map['blocked'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoUserDto.fromJson(String source) => CoUserDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoUserDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, username: $username, firstName: $firstName, lastName: $lastName, email: $email, isActive: $isActive, oldPassword: $oldPassword, password: $password, passwordConfirmation: $passwordConfirmation, name: $name, nickName: $nickName, birth: $birth, legalDocument: $legalDocument, emailValidated: $emailValidated, documentValidated: $documentValidated, cellPhone: $cellPhone, phoneValidated: $phoneValidated, coCultureId: $coCultureId, viewcoCultureId: $viewcoCultureId, basicAuthentication: $basicAuthentication, blocked: $blocked, type: $type)';
  }

  CoUserDto copyWith({
    String? classname,
    int? id,
    String? created,
    String? updated,
    int? couseridcre,
    int? couseridupd,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    bool? isActive,
    String? oldPassword,
    String? password,
    String? passwordConfirmation,
    String? name,
    String? nickName,
    String? birth,
    String? legalDocument,
    String? emailValidated,
    String? documentValidated,
    String? cellPhone,
    String? phoneValidated,
    int? coCultureId,
    String? viewcoCultureId,
    String? basicAuthentication,
    String? blocked,
    int? type,
  }) {
    return CoUserDto(
      classname: classname ?? this.classname,
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      couseridcre: couseridcre ?? this.couseridcre,
      couseridupd: couseridupd ?? this.couseridupd,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isActive: isActive ?? this.isActive,
      oldPassword: oldPassword ?? this.oldPassword,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      birth: birth ?? this.birth,
      legalDocument: legalDocument ?? this.legalDocument,
      emailValidated: emailValidated ?? this.emailValidated,
      documentValidated: documentValidated ?? this.documentValidated,
      cellPhone: cellPhone ?? this.cellPhone,
      phoneValidated: phoneValidated ?? this.phoneValidated,
      coCultureId: coCultureId ?? this.coCultureId,
      viewcoCultureId: viewcoCultureId ?? this.viewcoCultureId,
      basicAuthentication: basicAuthentication ?? this.basicAuthentication,
      blocked: blocked ?? this.blocked,
      type: type ?? this.type,
    );
  }
}
