// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultDtoHome = coResultDtoHomeFromMap(jsonString);



import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';

class CoResultDtoHome {
    final String? classname;
    final List<JornadaDTO>? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDtoHome({
    this.classname,
    this.data,
    this.withError,
    this.comessageList,
  });



  @override
  String toString() {
    return 'CoResultDtoHome(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'comessageList': comessageList,
    };
  }

  factory CoResultDtoHome.fromMap(Map<String, dynamic> map) {
    return CoResultDtoHome(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? List<JornadaDTO>.from((map['data'] as List<dynamic>).map<JornadaDTO?>((x) => JornadaDTO.fromMap(x as Map<String,dynamic>),),) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoHome.fromJson(String source) => CoResultDtoHome.fromMap(json.decode(source) as Map<String, dynamic>);
}
