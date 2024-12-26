
import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/loan/data/models/attribute_loan.dart';
import 'package:bkopen/loan/data/models/pagination.dart';

class CoResultDtoJornadaAtribute {
  final String? classname;
    final List<JornadaAtributoDTO>? data;
    final bool? withError;
    final Pagination? pagination;
    final List<ComessageList>? comessageList;
  CoResultDtoJornadaAtribute({
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

  factory CoResultDtoJornadaAtribute.fromMap(Map<String, dynamic> map) {
    return CoResultDtoJornadaAtribute(
      classname: map['classname'],
      data: map['data'] != null ? List<JornadaAtributoDTO>.from(map['data']?.map((x) => JornadaAtributoDTO.fromMap(x))) : null,
      withError: map['withError'],
      pagination: map['pagination'] != null ? Pagination.fromMap(map['pagination']) : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from(map['comessageList']?.map((x) => ComessageList.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoJornadaAtribute.fromJson(String source) => CoResultDtoJornadaAtribute.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoResultDtoJornadaAtribute(classname: $classname, data: $data, withError: $withError, pagination: $pagination, comessageList: $comessageList)';
  }
}
