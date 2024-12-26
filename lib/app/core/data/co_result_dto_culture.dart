import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/profile/data/models/co_culture_dto.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CoResultDtoPais {
   final String? classname;
    final List<CoCultureDto>? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDtoPais({
    this.classname,
    this.data,
    this.withError,
    this.comessageList,
  });




  @override
  String toString() {
    return 'CoResultDtoPais(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoPais.fromMap(Map<String, dynamic> map) {
    return CoResultDtoPais(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? List<CoCultureDto>.from((map['data'] as List<dynamic>).map<CoCultureDto?>((x) => CoCultureDto.fromMap(x as Map<String,dynamic>),),) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoPais.fromJson(String source) => CoResultDtoPais.fromMap(json.decode(source) as Map<String, dynamic>);
}
