// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'dart:convert';

import 'package:bkopen/loan/data/models/classe_secao_dto.dart';
import 'package:bkopen/loan/data/models/co_dynamic_attribute_dto.dart';

class CoDynamicSectionDTO {
    final String? classname;
    final ClasseSecaoDTO? section;
    final String? name;
    final String? identifier;
    final int? itensPerPage;
    final int? itensPerLine;
    final List<CoDynamicAttributeDTO>? attributes;
    
    final int? order;
  CoDynamicSectionDTO({
    this.classname,
    this.section,

    this.name,
    this.identifier,
    this.itensPerPage,
    this.itensPerLine,
    this.attributes,
    this.order,
  });
    


    


  @override
  String toString() {
    return 'CoDynamicSectionDTO(classname: $classname, name: $name, identifier: $identifier, itensPerPage: $itensPerPage, itensPerLine: $itensPerLine, attributes: $attributes, section: $section, order: $order)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'name': name,
      'identifier': identifier,
      'itensPerPage': itensPerPage,
      'itensPerLine': itensPerLine,
      'attributes': attributes?.map((x) => x.toMap()).toList(),
      'section': section?.toMap(),
      'order': order,
    };
  }

  factory CoDynamicSectionDTO.fromMap(Map<String, dynamic> map) {
    return CoDynamicSectionDTO(
      classname: map['classname'] != null ? map['classname'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      identifier: map['identifier'] != null ? map['identifier'] as String : null,
      itensPerPage: map['itensPerPage'] != null ? map['itensPerPage'] as int : null,
      itensPerLine: map['itensPerLine'] != null ? map['itensPerLine'] as int : null,
      attributes: map['attributes'] != null ? List<CoDynamicAttributeDTO>.from((map['attributes'] as List<dynamic>).map<CoDynamicAttributeDTO?>((x) => CoDynamicAttributeDTO.fromMap(x as Map<String,dynamic>),),) : null,
      section: map['section'] != null ? ClasseSecaoDTO.fromMap(map['section'] as Map<String,dynamic>) : null,
      order: map['order'] != null ? map['order'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoDynamicSectionDTO.fromJson(String source) => CoDynamicSectionDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
