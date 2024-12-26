// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';

class CoResultDtoProduct {


    final String? classname;
    final List<ProdutoParceiroDto>? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDtoProduct({
    this.classname,
    this.data,
    this.withError,
    this.comessageList,
  });

  

  @override
  String toString() {
    return 'CoResultDtoProduct(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoProduct.fromMap(Map<String, dynamic> map) {
    return CoResultDtoProduct(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? List<ProdutoParceiroDto>.from((map['data'] as List<dynamic>).map<ProdutoParceiroDto?>((x) => ProdutoParceiroDto.fromMap(x as Map<String,dynamic>),),) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoProduct.fromJson(String source) => CoResultDtoProduct.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProdutoParceiroDto {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final String? nome;
    final String? pagina;
    final int? classeProdutoId;
    final String? viewclasseProdutoId;
    final String? informacao;
    final String? informativoProdutos;
    final bool? restritoNessaJornada;
    final int? personalidade;
    final String? viewpersonalidade;
  ProdutoParceiroDto({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.nome,
    this.pagina,
    this.classeProdutoId,
    this.viewclasseProdutoId,
    this.informacao,
    this.informativoProdutos,
    this.restritoNessaJornada,
    this.personalidade,
    this.viewpersonalidade,
  });



  @override
  String toString() {
    return 'ProdutoParceiroDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, nome: $nome, pagina: $pagina, classeProdutoId: $classeProdutoId, viewclasseProdutoId: $viewclasseProdutoId, informacao: $informacao, informativoProdutos: $informativoProdutos, restritoNessaJornada: $restritoNessaJornada, personalidade: $personalidade, viewpersonalidade: $viewpersonalidade)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'nome': nome,
      'pagina': pagina,
      'classeProdutoId': classeProdutoId,
      'viewclasseProdutoId': viewclasseProdutoId,
      'informacao': informacao,
      'informativoProdutos': informativoProdutos,
      'restritoNessaJornada': restritoNessaJornada,
      'personalidade': personalidade,
      'viewpersonalidade': viewpersonalidade,
    };
  }

  factory ProdutoParceiroDto.fromMap(Map<String, dynamic> map) {
    return ProdutoParceiroDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre: map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd: map['couseridupd'] != null ? map['couseridupd'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      pagina: map['pagina'] != null ? map['pagina'] as String : null,
      classeProdutoId: map['classeProdutoId'] != null ? map['classeProdutoId'] as int : null,
      viewclasseProdutoId: map['viewclasseProdutoId'] != null ? map['viewclasseProdutoId'] as String : null,
      informacao: map['informacao'] != null ? map['informacao'] as String : null,
      informativoProdutos: map['informativoProdutos'] != null ? map['informativoProdutos'] as String : null,
      restritoNessaJornada: map['restritoNessaJornada'] != null ? map['restritoNessaJornada'] as bool : null,
      personalidade: map['personalidade'] != null ? map['personalidade'] as int : null,
      viewpersonalidade: map['viewpersonalidade'] != null ? map['viewpersonalidade'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoParceiroDto.fromJson(String source) => ProdutoParceiroDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
