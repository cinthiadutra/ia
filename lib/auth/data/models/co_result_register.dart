// ignore_for_file: public_member_api_docs, sort_constructors_first




import 'dart:convert';

import 'package:bkopen/auth/data/models/co_register_dto.dart';
import 'package:bkopen/auth/data/models/comessage_list.dart';

class CoResultDTORegister {
    final String classname;
    final CoRegisterDto? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDTORegister({
    this.classname = "CoResultDTO",
    this.data,
    this.withError,
    this.comessageList,
  });


  @override
  String toString() {
    return 'CoResultDTORegister(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.toMap(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDTORegister.fromMap(Map<String, dynamic> map) {
    return CoResultDTORegister(
      classname: map['classname'] as String,
      data: map['data'] != null ? CoRegisterDto.fromMap(map['data'] as Map<String,dynamic>) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDTORegister.fromJson(String source) => CoResultDTORegister.fromMap(json.decode(source) as Map<String, dynamic>);
}
