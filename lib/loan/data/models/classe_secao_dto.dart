import 'dart:convert';

class ClasseSecaoDTO {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final String? nome;
    final int? ordem;
    final int? classeProdutoId;
    final String? viewclasseProdutoId;
  ClasseSecaoDTO({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.nome,
    this.ordem,
    this.classeProdutoId,
    this.viewclasseProdutoId,
  });


  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'nome': nome,
      'ordem': ordem,
      'classeProdutoId': classeProdutoId,
      'viewclasseProdutoId': viewclasseProdutoId,
    };
  }

  factory ClasseSecaoDTO.fromMap(Map<String, dynamic> map) {
    return ClasseSecaoDTO(
      classname: map['classname'],
      id: map['id']?.toInt(),
      created: map['created'],
      updated: map['updated'],
      couseridcre: map['couseridcre']?.toInt(),
      couseridupd: map['couseridupd']?.toInt(),
      nome: map['nome'],
      ordem: map['ordem']?.toInt(),
      classeProdutoId: map['classeProdutoId']?.toInt(),
      viewclasseProdutoId: map['viewclasseProdutoId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClasseSecaoDTO.fromJson(String source) => ClasseSecaoDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClasseSecaoDTO(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, nome: $nome, ordem: $ordem, classeProdutoId: $classeProdutoId, viewclasseProdutoId: $viewclasseProdutoId)';
  }
}
