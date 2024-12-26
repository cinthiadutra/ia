

import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:bkopen/loan/data/models/pagination.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoResultDtoJornadaEtapa {
   final String? classname;
    final List<JornadaEtapaDto>? data;
    final bool? withError;
    final Pagination? pagination;
    final List<ComessageList>? comessageList;
  CoResultDtoJornadaEtapa({
    this.classname,
    this.data,
    this.withError,
    this.pagination,
    this.comessageList,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'pagination': pagination?.toMap(),
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoJornadaEtapa.fromMap(Map<String, dynamic> map) {
    return CoResultDtoJornadaEtapa(
      classname: map['classname'],
      data: map['data'] != null ? List<JornadaEtapaDto>.from(map['data']?.map((x) => JornadaEtapaDto.fromMap(x))) : null,
      withError: map['withError'],
      pagination: map['pagination'] != null ? Pagination.fromMap(map['pagination']) : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from(map['comessageList']?.map((x) => ComessageList.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoJornadaEtapa.fromJson(String source) => CoResultDtoJornadaEtapa.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoResultDtoJornadaEtapa(classname: $classname, data: $data, withError: $withError, pagination: $pagination, comessageList: $comessageList)';
  }
  }



