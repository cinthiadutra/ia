import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoCultureDto {
  final String? classname;
  final int? id;
  final String? created;
  final String? updated;
  final String? couseridcre;
  final String? couseridupd;
  final String? name;
  final String? acronym;
  final String? culture;
  final String? telPrefix;
  CoCultureDto({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.name,
    this.acronym,
    this.culture,
    this.telPrefix,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'name': name,
      'acronym': acronym,
      'culture': culture,
      'telPrefix': telPrefix,
    };
  }

  factory CoCultureDto.fromMap(Map<String, dynamic> map) {
    return CoCultureDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre:
          map['couseridcre'] != null ? map['couseridcre'] as String : null,
      couseridupd:
          map['couseridupd'] != null ? map['couseridupd'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      acronym: map['acronym'] != null ? map['acronym'] as String : null,
      culture: map['culture'] != null ? map['culture'] as String : null,
      telPrefix: map['telPrefix'] != null ? map['telPrefix'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoCultureDto.fromJson(String source) =>
      CoCultureDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoCultureDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, name: $name, acronym: $acronym, culture: $culture, telPrefix: $telPrefix)';
  }
}
