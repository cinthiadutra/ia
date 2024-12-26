// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultDtoFields = coResultDtoFieldsFromMap(jsonString);


import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';

class CoResultDtoFields {
    final String? classname;
    final CoDynamicFieldsDto? data;
    final bool? withError;
    final String? pagination;
    final List<ComessageList>? comessageList;

    CoResultDtoFields( {
        this.classname,
        this.data,
        this.withError,
        this.comessageList,
        this.pagination,
    });


  @override
  String toString() {
    return 'CoResultDtoFields(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList, pagination: $pagination,)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.toMap(),
      'withError': withError,
      'pagination':pagination,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoFields.fromMap(Map<String, dynamic> map) {
    return CoResultDtoFields(
      classname: map['classname'] != null ? map['classname'] as String : null,
      pagination: map['pagination'] != null ? map['pagination'] as String : null,
      data: map['data'] != null ? CoDynamicFieldsDto.fromMap(map['data'] as Map<String,dynamic>) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoFields.fromJson(String source) => CoResultDtoFields.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CoDynamicFieldsDto {
    final String? classname;
    final List<CoDynamicSectionDTO>? sections;
  CoDynamicFieldsDto({
    this.classname,
    this.sections,
  });

   

  @override
  String toString() => 'CoDynamicFieldsDto(classname: $classname, sections: $sections)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'sections': sections?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoDynamicFieldsDto.fromMap(Map<String, dynamic> map) {
    return CoDynamicFieldsDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      sections: map['sections'] != null ? List<CoDynamicSectionDTO>.from((map['sections'] as List<dynamic>).map<CoDynamicSectionDTO?>((x) => CoDynamicSectionDTO.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoDynamicFieldsDto.fromJson(String source) => CoDynamicFieldsDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
