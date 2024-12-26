// To parse this JSON data, do
//
//     final coResultDtoParceiro = coResultDtoParceiroFromMap(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

import 'package:bkopen/loan/data/models/pagination.dart';

CoResultDtoParceiro coResultDtoParceiroFromMap(String str) => CoResultDtoParceiro.fromMap(json.decode(str));

String coResultDtoParceiroToMap(CoResultDtoParceiro data) => json.encode(data.toMap());

class CoResultDtoParceiro {
    final String? classname;
    final List<ProdutoParceiroDTO>? data;
    final Pagination? pagination;
    final bool? withError;
    final List<dynamic>? comessageList;

    CoResultDtoParceiro({
        this.classname,
        this.data,
        this.pagination,
        this.withError,
        this.comessageList,
    });

    factory CoResultDtoParceiro.fromMap(Map<String, dynamic> json) => CoResultDtoParceiro(
        classname: json["classname"],
        data: json["data"] == null ? [] : List<ProdutoParceiroDTO>.from(json["data"]!.map((x) => ProdutoParceiroDTO.fromMap(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromMap(json["pagination"]),
        withError: json["withError"],
        comessageList: json["comessageList"] == null ? [] : List<dynamic>.from(json["comessageList"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "classname": classname,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "pagination": pagination?.toMap(),
        "withError": withError,
        "comessageList": comessageList == null ? [] : List<dynamic>.from(comessageList!.map((x) => x)),
    };
}

class ProdutoParceiroDTO {
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
    final dynamic identificador;
    final dynamic personalidade;
    final dynamic viewpersonalidade;

    ProdutoParceiroDTO({
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
        this.identificador,
        this.personalidade,
        this.viewpersonalidade,
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
      'pagina': pagina,
      'classeProdutoId': classeProdutoId,
      'viewclasseProdutoId': viewclasseProdutoId,
      'informacao': informacao,
      'informativoProdutos': informativoProdutos,
      'restritoNessaJornada': restritoNessaJornada,
      'identificador': identificador,
      'personalidade': personalidade,
      'viewpersonalidade': viewpersonalidade,
    };
  }

  factory ProdutoParceiroDTO.fromMap(Map<String, dynamic> map) {
    return ProdutoParceiroDTO(
      classname: map['classname'],
      id: map['id']?.toInt(),
      created: map['created'],
      updated: map['updated'],
      couseridcre: map['couseridcre']?.toInt(),
      couseridupd: map['couseridupd']?.toInt(),
      nome: map['nome'],
      pagina: map['pagina'],
      classeProdutoId: map['classeProdutoId']?.toInt(),
      viewclasseProdutoId: map['viewclasseProdutoId'],
      informacao: map['informacao'],
      informativoProdutos: map['informativoProdutos'],
      restritoNessaJornada: map['restritoNessaJornada'],
      identificador: map['identificador'],
      personalidade: map['personalidade'],
      viewpersonalidade: map['viewpersonalidade'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdutoParceiroDTO.fromJson(String source) => ProdutoParceiroDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProdutoParceiroDTO(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, nome: $nome, pagina: $pagina, classeProdutoId: $classeProdutoId, viewclasseProdutoId: $viewclasseProdutoId, informacao: $informacao, informativoProdutos: $informativoProdutos, restritoNessaJornada: $restritoNessaJornada, identificador: $identificador, personalidade: $personalidade, viewpersonalidade: $viewpersonalidade)';
  }
}
