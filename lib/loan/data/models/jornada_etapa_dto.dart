// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultDtoFields = coResultDtoFieldsFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:bkopen/loan/data/models/attribute_loan.dart';

class JornadaEtapaDto {
  final String? classname;
  final int? id;
  final String? created;
  final String? updated;
  final int? couseridcre;
  final int? couseridupd;
  final int? jornada;
  final int? subjornada;
  final String? inicio;
  final String? termino;
  final String? cet;
  final bool? restricao;
  final bool? elegivel;
  final String? comentario;
  final int? jornadaOriId;
  final String? viewjornadaOriId;
  final int? jornadaEtapaDesId;
  final String? viewjornadaEtapaDesId;
  final int? agenteParceiroId;
  final String? viewagenteParceiroId;
  int? produtoParceiroId;
  final String? viewprodutoParceiroId;
  final String? viewclienteId;
  final String? viewclasseProdutoId;
  final String? view;
  final dynamic restricoes;
  final List<JornadaAtributoDTO>? valoresSaida;
  final String? viewjornada;
  final String? viewsubjornada;
  JornadaEtapaDto({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.jornada,
    this.subjornada,
    this.inicio,
    this.termino,
    this.cet,
    this.restricao,
    this.elegivel,
    this.comentario,
    this.jornadaOriId,
    this.viewjornadaOriId,
    this.jornadaEtapaDesId,
    this.viewjornadaEtapaDesId,
    this.agenteParceiroId,
    this.viewagenteParceiroId,
    this.produtoParceiroId,
    this.viewprodutoParceiroId,
    this.viewclienteId,
    this.viewclasseProdutoId,
    this.view,
    this.restricoes,
    this.valoresSaida,
    this.viewjornada,
    this.viewsubjornada,
  });


  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'jornada': jornada,
      'subjornada': subjornada,
      'inicio': inicio,
      'termino': termino,
      'cet': cet,
      'restricao': restricao,
      'elegivel': elegivel,
      'comentario': comentario,
      'jornadaOriId': jornadaOriId,
      'viewjornadaOriId': viewjornadaOriId,
      'jornadaEtapaDesId': jornadaEtapaDesId,
      'viewjornadaEtapaDesId': viewjornadaEtapaDesId,
      'agenteParceiroId': agenteParceiroId,
      'viewagenteParceiroId': viewagenteParceiroId,
      'produtoParceiroId': produtoParceiroId,
      'viewprodutoParceiroId': viewprodutoParceiroId,
      'viewclienteId': viewclienteId,
      'viewclasseProdutoId': viewclasseProdutoId,
      'view': view,
      'restricoes': restricoes,
      'valoresSaida': valoresSaida?.map((x) => x.toMap()).toList(),
      'viewjornada': viewjornada,
      'viewsubjornada': viewsubjornada,
    };
  }

  factory JornadaEtapaDto.fromMap(Map<String, dynamic> map) {
    return JornadaEtapaDto(
      classname: map['classname'],
      id: map['id']?.toInt(),
      created: map['created'],
      updated: map['updated'],
      couseridcre: map['couseridcre']?.toInt(),
      couseridupd: map['couseridupd']?.toInt(),
      jornada: map['jornada']?.toInt(),
      subjornada: map['subjornada']?.toInt(),
      inicio: map['inicio'],
      termino: map['termino'],
      cet: map['cet'],
      restricao: map['restricao'],
      elegivel: map['elegivel'],
      comentario: map['comentario'],
      jornadaOriId: map['jornadaOriId']?.toInt(),
      viewjornadaOriId: map['viewjornadaOriId'],
      jornadaEtapaDesId: map['jornadaEtapaDesId']?.toInt(),
      viewjornadaEtapaDesId: map['viewjornadaEtapaDesId'],
      agenteParceiroId: map['agenteParceiroId']?.toInt(),
      viewagenteParceiroId: map['viewagenteParceiroId'],
      produtoParceiroId: map['produtoParceiroId']?.toInt(),
      viewprodutoParceiroId: map['viewprodutoParceiroId'],
      viewclienteId: map['viewclienteId'],
      viewclasseProdutoId: map['viewclasseProdutoId'],
      view: map['view'],
      restricoes: map['restricoes'],
      valoresSaida: map['valoresSaida'] != null ? List<JornadaAtributoDTO>.from(map['valoresSaida']?.map((x) => JornadaAtributoDTO.fromMap(x))) : null,
      viewjornada: map['viewjornada'],
      viewsubjornada: map['viewsubjornada'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JornadaEtapaDto.fromJson(String source) => JornadaEtapaDto.fromMap(json.decode(source));

  JornadaEtapaDto copyWith({
    ValueGetter<String?>? classname,
    ValueGetter<int?>? id,
    ValueGetter<String?>? created,
    ValueGetter<String?>? updated,
    ValueGetter<int?>? couseridcre,
    ValueGetter<int?>? couseridupd,
    ValueGetter<int?>? jornada,
    ValueGetter<int?>? subjornada,
    ValueGetter<String?>? inicio,
    ValueGetter<String?>? termino,
    ValueGetter<String?>? cet,
    ValueGetter<bool?>? restricao,
    ValueGetter<bool?>? elegivel,
    ValueGetter<String?>? comentario,
    ValueGetter<int?>? jornadaOriId,
    ValueGetter<String?>? viewjornadaOriId,
    ValueGetter<int?>? jornadaEtapaDesId,
    ValueGetter<String?>? viewjornadaEtapaDesId,
    ValueGetter<int?>? agenteParceiroId,
    ValueGetter<String?>? viewagenteParceiroId,
    ValueGetter<int?>? produtoParceiroId,
    ValueGetter<String?>? viewprodutoParceiroId,
    ValueGetter<String?>? viewclienteId,
    ValueGetter<String?>? viewclasseProdutoId,
    ValueGetter<String?>? view,
    ValueGetter<dynamic>? restricoes,
    ValueGetter<List<JornadaAtributoDTO>?>? valoresSaida,
    ValueGetter<String?>? viewjornada,
    ValueGetter<String?>? viewsubjornada,
  }) {
    return JornadaEtapaDto(
      classname: classname != null ? classname() : this.classname,
      id: id != null ? id() : this.id,
      created: created != null ? created() : this.created,
      updated: updated != null ? updated() : this.updated,
      couseridcre: couseridcre != null ? couseridcre() : this.couseridcre,
      couseridupd: couseridupd != null ? couseridupd() : this.couseridupd,
      jornada: jornada != null ? jornada() : this.jornada,
      subjornada: subjornada != null ? subjornada() : this.subjornada,
      inicio: inicio != null ? inicio() : this.inicio,
      termino: termino != null ? termino() : this.termino,
      cet: cet != null ? cet() : this.cet,
      restricao: restricao != null ? restricao() : this.restricao,
      elegivel: elegivel != null ? elegivel() : this.elegivel,
      comentario: comentario != null ? comentario() : this.comentario,
      jornadaOriId: jornadaOriId != null ? jornadaOriId() : this.jornadaOriId,
      viewjornadaOriId: viewjornadaOriId != null ? viewjornadaOriId() : this.viewjornadaOriId,
      jornadaEtapaDesId: jornadaEtapaDesId != null ? jornadaEtapaDesId() : this.jornadaEtapaDesId,
      viewjornadaEtapaDesId: viewjornadaEtapaDesId != null ? viewjornadaEtapaDesId() : this.viewjornadaEtapaDesId,
      agenteParceiroId: agenteParceiroId != null ? agenteParceiroId() : this.agenteParceiroId,
      viewagenteParceiroId: viewagenteParceiroId != null ? viewagenteParceiroId() : this.viewagenteParceiroId,
      produtoParceiroId: produtoParceiroId != null ? produtoParceiroId() : this.produtoParceiroId,
      viewprodutoParceiroId: viewprodutoParceiroId != null ? viewprodutoParceiroId() : this.viewprodutoParceiroId,
      viewclienteId: viewclienteId != null ? viewclienteId() : this.viewclienteId,
      viewclasseProdutoId: viewclasseProdutoId != null ? viewclasseProdutoId() : this.viewclasseProdutoId,
      view: view != null ? view() : this.view,
      restricoes: restricoes != null ? restricoes() : this.restricoes,
      valoresSaida: valoresSaida != null ? valoresSaida() : this.valoresSaida,
      viewjornada: viewjornada != null ? viewjornada() : this.viewjornada,
      viewsubjornada: viewsubjornada != null ? viewsubjornada() : this.viewsubjornada,
    );
  }

  @override
  String toString() {
    return 'JornadaEtapaDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, jornada: $jornada, subjornada: $subjornada, inicio: $inicio, termino: $termino, cet: $cet, restricao: $restricao, elegivel: $elegivel, comentario: $comentario, jornadaOriId: $jornadaOriId, viewjornadaOriId: $viewjornadaOriId, jornadaEtapaDesId: $jornadaEtapaDesId, viewjornadaEtapaDesId: $viewjornadaEtapaDesId, agenteParceiroId: $agenteParceiroId, viewagenteParceiroId: $viewagenteParceiroId, produtoParceiroId: $produtoParceiroId, viewprodutoParceiroId: $viewprodutoParceiroId, viewclienteId: $viewclienteId, viewclasseProdutoId: $viewclasseProdutoId, view: $view, restricoes: $restricoes, valoresSaida: $valoresSaida, viewjornada: $viewjornada, viewsubjornada: $viewsubjornada)';
  }
}
