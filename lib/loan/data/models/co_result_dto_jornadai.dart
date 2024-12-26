import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoResultDtoJornadaI {
   final String? classname;
    final JornadaDTO? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDtoJornadaI({
    this.classname,
    this.data,
    this.withError,
    this.comessageList,
  });

 


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.toMap(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoJornadaI.fromMap(Map<String, dynamic> map) {
    return CoResultDtoJornadaI(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? JornadaDTO.fromMap(map['data'] as Map<String,dynamic>) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoJornadaI.fromJson(String source) => CoResultDtoJornadaI.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoResultDtoJornadaI(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }
}
