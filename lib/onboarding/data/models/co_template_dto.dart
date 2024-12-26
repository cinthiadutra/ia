// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../auth/data/models/comessage_list.dart';

class CoTemplateDto {
  CoTemplateDto({
   this.classname = 'CoTemplateDTO',
    this.data,
    this.withError,
    this.comessageList,
  });

  final String classname;
  final List<CoTemplateDto>? data;
  final bool? withError;
  final List<ComessageList>? comessageList;

  @override
  String toString() {
    return 'CoTemplateDto(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoTemplateDto.fromMap(Map<String, dynamic> map) {
    return CoTemplateDto(
      classname: map['classname'] as String,
      data: map['data'] != null ? List<CoTemplateDto>.from((map['data'] as List<dynamic>).map<CoTemplateDto?>((x) => CoTemplateDto.fromMap(x as Map<String,dynamic>),),) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoTemplateDto.fromJson(String source) => CoTemplateDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
