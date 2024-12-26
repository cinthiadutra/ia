// To parse this JSON data, do
//
//     final coResultDtoTabela = coResultDtoTabelaFromMap(jsonString);

import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/loan/data/models/pagination.dart';

CoResultDtoTabela coResultDtoTabelaFromMap(String str) => CoResultDtoTabela.fromMap(json.decode(str));

String coResultDtoTabelaToMap(CoResultDtoTabela data) => json.encode(data.toMap());

class CoResultDtoTabela {
    final String? classname;
    final List<TabelaDto>? data;
    final Pagination? pagination;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDtoTabela({
    this.classname,
    this.data,
    required this.pagination,
    this.withError,
    this.comessageList,
  });

   

  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'pagination': pagination?.toMap(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoTabela.fromMap(Map<String, dynamic> map) {
    return CoResultDtoTabela(
      classname: map['classname'],
      data: map['data'] != null ? List<TabelaDto>.from(map['data']?.map((x) => TabelaDto.fromMap(x))) : null,
      pagination: map['pagination'] != null ? Pagination.fromMap(map['pagination']) : null,
      withError: map['withError'],
      comessageList: map['comessageList'] != null ? List<ComessageList>.from(map['comessageList']?.map((x) => ComessageList.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoTabela.fromJson(String source) => CoResultDtoTabela.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoResultDtoTabela(classname: $classname, data: $data, pagination: $pagination, withError: $withError, comessageList: $comessageList)';
  }
}

class TabelaDto {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final int? tipoTabelaId;
    final String? viewtipoTabelaId;
    final String? nome;
    final bool? ativo;
    final String? codigo;
    final dynamic ordem;

    TabelaDto({
        this.classname,
        this.id,
        this.created,
        this.updated,
        this.couseridcre,
        this.couseridupd,
        this.tipoTabelaId,
        this.viewtipoTabelaId,
        this.nome,
        this.ativo,
        this.codigo,
        this.ordem,
    });


  @override
  String toString() {
    return 'TabelaDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, tipoTabelaId: $tipoTabelaId, viewtipoTabelaId: $viewtipoTabelaId, nome: $nome, ativo: $ativo, codigo: $codigo, ordem: $ordem)';
  }

  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'tipoTabelaId': tipoTabelaId,
      'viewtipoTabelaId': viewtipoTabelaId,
      'nome': nome,
      'ativo': ativo,
      'codigo': codigo,
      'ordem': ordem,
    };
  }

  factory TabelaDto.fromMap(Map<String, dynamic> map) {
    return TabelaDto(
      classname: map['classname'],
      id: map['id']?.toInt(),
      created: map['created'],
      updated: map['updated'],
      couseridcre: map['couseridcre']?.toInt(),
      couseridupd: map['couseridupd']?.toInt(),
      tipoTabelaId: map['tipoTabelaId']?.toInt(),
      viewtipoTabelaId: map['viewtipoTabelaId'],
      nome: map['nome'],
      ativo: map['ativo'],
      codigo: map['codigo'],
      ordem: map['ordem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TabelaDto.fromJson(String source) => TabelaDto.fromMap(json.decode(source));
}
