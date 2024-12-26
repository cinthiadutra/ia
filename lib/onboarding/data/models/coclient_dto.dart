import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoclientDto {
  final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final String? admission;
    final String? authdoc;
    final String? email;
    final String? name;
    final String? nick;
    final String? sourceKey;
    final int? business;
    final int? state;
    final String? termsOfUse;
    final int? type;
    final String? cellPhone;
    final int? coCultureId;
    final int? coUserId;
    final String? viewcoCultureId;
    final String? viewcoUserId;
    final String? viewbusiness;
    final String? viewstate;
    final String? viewtype;
  CoclientDto({
    this.classname ="CoClientDTO",
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.admission,
    this.authdoc,
    this.email,
    this.name,
    this.nick,
    this.sourceKey,
    this.business,
    this.state,
    this.termsOfUse,
    this.type,
    this.cellPhone,
    this.coCultureId,
    this.coUserId,
    this.viewcoCultureId,
    this.viewcoUserId,
     this.viewbusiness,
    this.viewstate,
    this.viewtype,
  });

  @override
  String toString() {
    return 'CoclientDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, admission: $admission, authdoc: $authdoc, email: $email, name: $name, nick: $nick, sourceKey: $sourceKey, business: $business, state: $state, termsOfUse: $termsOfUse, type: $type, cellPhone: $cellPhone, coCultureId: $coCultureId, coUserId: $coUserId, viewcoCultureId: $viewcoCultureId, viewcoUserId: $viewcoUserId, viewbusiness: $viewbusiness, viewstate: $viewstate, viewtype: $viewtype)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'admission': admission,
      'authdoc': authdoc,
      'email': email,
      'name': name,
      'nick': nick,
      'sourceKey': sourceKey,
      'business': business,
      'state': state,
      'termsOfUse': termsOfUse,
      'type': type,
      'cellPhone': cellPhone,
      'coCultureId': coCultureId,
      'coUserId': coUserId,
      'viewcoCultureId': viewcoCultureId,
      'viewcoUserId': viewcoUserId,
      'viewbusiness': viewbusiness,
      'viewstate': viewstate,
      'viewtype': viewtype,
    };
  }
   Map<String, dynamic> toMapC() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      
    };
  }

  factory CoclientDto.fromMap(Map<String, dynamic> map) {
    return CoclientDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre: map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd: map['couseridupd'] != null ? map['couseridupd'] as int : null,
      admission: map['admission'] != null ? map['admission'] as String : null,
      authdoc: map['authdoc'] != null ? map['authdoc'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      nick: map['nick'] != null ? map['nick'] as String : null,
      sourceKey: map['sourceKey'] != null ? map['sourceKey'] as String : null,
      business: map['business'] != null ? map['business'] as int : null,
      state: map['state'] != null ? map['state'] as int : null,
      termsOfUse: map['termsOfUse'] != null ? map['termsOfUse'] as String : null,
      type: map['type'] != null ? map['type'] as int : null,
      cellPhone: map['cellPhone'] != null ? map['cellPhone'] as String : null,
      coCultureId: map['coCultureId'] != null ? map['coCultureId'] as int : null,
      coUserId: map['coUserId'] != null ? map['coUserId'] as int : null,
      viewcoCultureId: map['viewcoCultureId'] != null ? map['viewcoCultureId'] as String : null,
      viewcoUserId: map['viewcoUserId'] != null ? map['viewcoUserId'] as String : null,
      viewbusiness: map['viewbusiness'] as dynamic,
      viewstate: map['viewstate'] != null ? map['viewstate'] as String : null,
      viewtype: map['viewtype'] != null ? map['viewtype'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoclientDto.fromJson(String source) => CoclientDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
