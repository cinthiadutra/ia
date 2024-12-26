// ignore_for_file: file_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields

class BeOnBoardingDTO {
  final String? classname;
  final int? id;
  final String? created;
  final String? updated;
  final int? couseridcre;
  final int? couseridupd;
  final String? authCellPhone;
  final String? billing;
  final String? legalDocument;
  final String? termsOfUse;
  final String? termsOfAdhesion;

  final String? video;
  final String? finished;
  final int? coUserId;
  final String? viewcoUserId;
  final int? auApplicationId;
  final String? viewauApplicationId;
  BeOnBoardingDTO({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.authCellPhone,
    this.billing,
    this.legalDocument,
    this.termsOfUse,
    this.video,
    this.finished,
    this.coUserId,
    this.viewcoUserId,
    this.auApplicationId,
    this.viewauApplicationId,
    this.termsOfAdhesion, 
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'authCellPhone': authCellPhone,
      'billing': billing,
      'legalDocument': legalDocument,
      'termsOfUse': termsOfUse,
      'video': video,
      'finished': finished,
      'coUserId': coUserId,
      'viewcoUserId': viewcoUserId,
      'auApplicationId': auApplicationId,
      'viewauApplicationId': viewauApplicationId,
      'termsOfAdhesion':termsOfAdhesion
    };
  }

  factory BeOnBoardingDTO.fromMap(Map<String, dynamic> map) {
    return BeOnBoardingDTO(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre:
          map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd:
          map['couseridupd'] != null ? map['couseridupd'] as int : null,
      authCellPhone:
          map['authCellPhone'] != null ? map['authCellPhone'] as String : null,
      billing: map['billing'] != null ? map['billing'] as String : null,
      legalDocument:
          map['legalDocument'] != null ? map['legalDocument'] as String : null,
      termsOfUse:
          map['termsOfUse'] != null ? map['termsOfUse'] as String : null,
      video: map['video'] != null ? map['video'] as String : null,
      finished: map['finished'] != null ? map['finished'] as String : null,
      coUserId: map['coUserId'] != null ? map['coUserId'] as int : null,
      viewcoUserId:
          map['viewcoUserId'] != null ? map['viewcoUserId'] as String : null,
      auApplicationId:
          map['auApplicationId'] != null ? map['auApplicationId'] as int : null,
      viewauApplicationId: map['viewauApplicationId'] != null
          ? map['viewauApplicationId'] as String
          : null,
      termsOfAdhesion:     map['termsOfAdhesion'] != null ? map['termsOfAdhesion'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BeOnBoardingDTO.fromJson(String source) =>
      BeOnBoardingDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BeOnBoardingDTO(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, authCellPhone: $authCellPhone, billing: $billing, legalDocument: $legalDocument, termsOfUse: $termsOfUse, video: $video, finished: $finished, coUserId: $coUserId, viewcoUserId: $viewcoUserId, auApplicationId: $auApplicationId, viewauApplicationId: $viewauApplicationId, termsOfAdhesion:$termsOfAdhesion)';
  }
}
