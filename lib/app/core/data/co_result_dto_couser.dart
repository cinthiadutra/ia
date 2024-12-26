// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/app/core/data/co_user_dto.dart';

class CoResultDTOCoUser {
    final String classname;
    final List<CoUserDto>? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDTOCoUser({
    this.classname = "CoResultDTO",
    this.data,
    this.withError,
    this.comessageList,
  });



  @override
  String toString() {
    return 'CoResultDTOCoUser(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDTOCoUser.fromMap(Map<String, dynamic> map) {
    return CoResultDTOCoUser(
      classname: map['classname'] as String,
      data: map['data'] != null ? List<CoUserDto>.from((map['data'] as List<dynamic>).map<CoUserDto?>((x) => CoUserDto.fromMap(x as Map<String,dynamic>),),) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDTOCoUser.fromJson(String source) => CoResultDTOCoUser.fromMap(json.decode(source) as Map<String, dynamic>);
}
