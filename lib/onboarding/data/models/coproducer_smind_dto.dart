import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoproducerSmindDto {
  final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final String? start;
    final String? finish;
    final String? name;
    final String? key;
    final int? status;
    final int? coCultureId;
    final int? coTablePlanId;
    final int? coClientId;
    final String? viewcoCultureId;
    final String? viewcoTablePlanId;
    final String? viewcoClientId;
    final String? consumerKey;
    final int? dPersonaId;
    final String? viewstatus;
  CoproducerSmindDto({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.start,
    this.finish,
    this.name,
    this.key,
    this.status,
    this.coCultureId,
    this.coTablePlanId,
    this.coClientId,
    this.viewcoCultureId,
    this.viewcoTablePlanId,
    this.viewcoClientId,
    this.consumerKey,
    this.dPersonaId,
    this.viewstatus,
  });

  @override
  String toString() {
    return 'CoproducerSmindDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, start: $start, finish: $finish, name: $name, key: $key, status: $status, coCultureId: $coCultureId, coTablePlanId: $coTablePlanId, coClientId: $coClientId, viewcoCultureId: $viewcoCultureId, viewcoTablePlanId: $viewcoTablePlanId, viewcoClientId: $viewcoClientId, consumerKey: $consumerKey, dPersonaId: $dPersonaId, viewstatus: $viewstatus)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'start': start,
      'finish': finish,
      'name': name,
      'key': key,
      'status': status,
      'coCultureId': coCultureId,
      'coTablePlanId': coTablePlanId,
      'coClientId': coClientId,
      'viewcoCultureId': viewcoCultureId,
      'viewcoTablePlanId': viewcoTablePlanId,
      'viewcoClientId': viewcoClientId,
      'consumerKey': consumerKey,
      'dPersonaId': dPersonaId,
      'viewstatus': viewstatus,
    };
  }
  Map<String, dynamic> toMapC() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      
    };
  }

  factory CoproducerSmindDto.fromMap(Map<String, dynamic> map) {
    return CoproducerSmindDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre: map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd: map['couseridupd'] != null ? map['couseridupd'] as int : null,
      start: map['start'] != null ? map['start'] as String : null,
      finish: map['finish'] != null ? map['finish'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      key: map['key'] != null ? map['key'] as String : null,
      status: map['status'] != null ? map['status'] as int : null,
      coCultureId: map['coCultureId'] != null ? map['coCultureId'] as int : null,
      coTablePlanId: map['coTablePlanId'] != null ? map['coTablePlanId'] as int : null,
      coClientId: map['coClientId'] != null ? map['coClientId'] as int : null,
      viewcoCultureId: map['viewcoCultureId'] != null ? map['viewcoCultureId'] as String : null,
      viewcoTablePlanId: map['viewcoTablePlanId'] != null ? map['viewcoTablePlanId'] as String : null,
      viewcoClientId: map['viewcoClientId'] != null ? map['viewcoClientId'] as String : null,
      consumerKey: map['consumerKey'] != null ? map['consumerKey'] as String : null,
      dPersonaId: map['dPersonaId'] != null ? map['dPersonaId'] as int : null,
      viewstatus: map['viewstatus'] != null ? map['viewstatus'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoproducerSmindDto.fromJson(String source) => CoproducerSmindDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
