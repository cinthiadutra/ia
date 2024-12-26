// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';


class CoResultDTO {
    final String classname;
    final dynamic data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDTO({
    this.classname = "CoResultDTO",
    this.data,
    this.withError,
    this.comessageList,
  });

   

  @override
  String toString() {
    return 'CoResultDTO(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data,
      'withError': withError,
      'comessageList': comessageList == null ? [] : List<dynamic>.from(comessageList!.map((x) => x.toMap())),
    };
  }

  factory CoResultDTO.fromMap(Map<String, dynamic> map) {
    return CoResultDTO(
      classname: map['classname'] as String,
      data: map['data'] != null ? map['data'] as dynamic : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDTO.fromJson(String source) => CoResultDTO.fromMap(json.decode(source) as Map<String, dynamic>);

  CoResultDTO copyWith({
    String? classname,
    String? data,
    bool? withError,
    List<ComessageList>? comessageList,
  }) {
    return CoResultDTO(
      classname: classname ?? this.classname,
      data: data ?? this.data,
      withError: withError ?? this.withError,
      comessageList: comessageList ?? this.comessageList,
    );
  }
}


