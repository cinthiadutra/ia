// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultDtoUser = coResultDtoUserFromMap(jsonString);

import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';

CoResultDtoUser coResultDtoUserFromMap(String str) => CoResultDtoUser.fromMap(json.decode(str));

String coResultDtoUserToMap(CoResultDtoUser data) => json.encode(data.toMap());

class CoResultDtoUser {
    final String? classname;
    final CoUserDTO? data;
    final bool? withError;
    final List<ComessageList>? comessageList;

    CoResultDtoUser({
        this.classname,
        this.data,
        this.withError,
        this.comessageList,
    });

 

  @override
  String toString() {
    return 'CoResultDtoUser(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.toMap(),
      'withError': withError,
      'comessageList': comessageList,
    };
  }

  factory CoResultDtoUser.fromMap(Map<String, dynamic> map) {
    return CoResultDtoUser(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? CoUserDTO.fromMap(map['data'] as Map<String,dynamic>) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoUser.fromJson(String source) => CoResultDtoUser.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CoUserDTO {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final String? username;
    final String? firstName;
    final String? lastName;
    final String? email;
    final bool? isActive;
    final String? oldPassword;
    final String? password;
    final String? passwordConfirmation;
    final String? name;
    final String? nickName;
    final String? birth;
    final String? legalDocument;
    final String? emailValidated;
    final String? documentValidated;
    final String? cellPhone;
    final String? phoneValidated;
    final int? coCultureId;
    final String? viewcoCultureId;
    final String? basicAuthentication;
    final bool? blocked;
    final int? type;

    CoUserDTO({
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

  factory CoUserDTO.fromMap(Map<String, dynamic> map) {
    return CoUserDTO(
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
      blocked: map['blocked'] != null ? map['blocked'] as bool : null,
      type: map['type'] != null ? map['type'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoUserDTO.fromJson(String source) => CoUserDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoUserDTO(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, username: $username, firstName: $firstName, lastName: $lastName, email: $email, isActive: $isActive, oldPassword: $oldPassword, password: $password, passwordConfirmation: $passwordConfirmation, name: $name, nickName: $nickName, birth: $birth, legalDocument: $legalDocument, emailValidated: $emailValidated, documentValidated: $documentValidated, cellPhone: $cellPhone, phoneValidated: $phoneValidated, coCultureId: $coCultureId, viewcoCultureId: $viewcoCultureId, basicAuthentication: $basicAuthentication, blocked: $blocked, type: $type)';
  }
}
