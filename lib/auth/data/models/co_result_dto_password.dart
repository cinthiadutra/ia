import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoResultDtoPassword {
  final String? classname;
  final CoResultDtoP? data;
  final bool? withError;
  final List<ComessageList>? comessageList;
  CoResultDtoPassword({
    this.classname,
    this.data,
    this.withError,
    this.comessageList,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.toMap(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoPassword.fromMap(Map<String, dynamic> map) {
    return CoResultDtoPassword(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? CoResultDtoP.fromMap(map['data'] as Map<String,dynamic>) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoPassword.fromJson(String source) => CoResultDtoPassword.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CoResultDtoP {
  final String? classname;
  final CoResultDtoResetData? data;
  final bool? withError;
  final List<dynamic>? comessageList;
  CoResultDtoP({
    this.classname,
    this.data,
    this.withError,
    this.comessageList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': "CoResultDto",
      'data': data?.toMap(),
      'withError': withError,
      'comessageList': comessageList,
    };
  }

  factory CoResultDtoP.fromMap(Map<String, dynamic> map) {
    return CoResultDtoP(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null
          ? CoResultDtoResetData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null
          ? List<dynamic>.from((map['comessageList'] as List<dynamic>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoP.fromJson(String source) =>
      CoResultDtoP.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoResultDtoP(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }
}

class CoResultDtoResetData {
  final String? classname;
  final int? id;
  final String? created;
  final String? updated;
  final String? couseridcre;
  final String? couseridupd;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? isActive;
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
  final String? coCultureId;
  final String? viewcoCultureId;
  final String? basicAuthentication;
  final String? blocked;
  final String? type;
  CoResultDtoResetData({
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

  @override
  String toString() {
    return 'CoResultDtoResetData(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, username: $username, firstName: $firstName, lastName: $lastName, email: $email, isActive: $isActive, oldPassword: $oldPassword, password: $password, passwordConfirmation: $passwordConfirmation, name: $name, nickName: $nickName, birth: $birth, legalDocument: $legalDocument, emailValidated: $emailValidated, documentValidated: $documentValidated, cellPhone: $cellPhone, phoneValidated: $phoneValidated, coCultureId: $coCultureId, viewcoCultureId: $viewcoCultureId, basicAuthentication: $basicAuthentication, blocked: $blocked, type: $type)';
  }

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

  factory CoResultDtoResetData.fromMap(Map<String, dynamic> map) {
    return CoResultDtoResetData(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre:
          map['couseridcre'] != null ? map['couseridcre'] as String : null,
      couseridupd:
          map['couseridupd'] != null ? map['couseridupd'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as String : null,
      oldPassword:
          map['oldPassword'] != null ? map['oldPassword'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      passwordConfirmation: map['passwordConfirmation'] != null
          ? map['passwordConfirmation'] as String
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      nickName: map['nickName'] != null ? map['nickName'] as String : null,
      birth: map['birth'] != null ? map['birth'] as String : null,
      legalDocument:
          map['legalDocument'] != null ? map['legalDocument'] as String : null,
      emailValidated: map['emailValidated'] != null
          ? map['emailValidated'] as String
          : null,
      documentValidated: map['documentValidated'] != null
          ? map['documentValidated'] as String
          : null,
      cellPhone: map['cellPhone'] != null ? map['cellPhone'] as String : null,
      phoneValidated: map['phoneValidated'] != null
          ? map['phoneValidated'] as String
          : null,
      coCultureId:
          map['coCultureId'] != null ? map['coCultureId'] as String : null,
      viewcoCultureId: map['viewcoCultureId'] != null
          ? map['viewcoCultureId'] as String
          : null,
      basicAuthentication: map['basicAuthentication'] != null
          ? map['basicAuthentication'] as String
          : null,
      blocked: map['blocked'] != null ? map['blocked'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoResetData.fromJson(String source) =>
      CoResultDtoResetData.fromMap(json.decode(source) as Map<String, dynamic>);
}
