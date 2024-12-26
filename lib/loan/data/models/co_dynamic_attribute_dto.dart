

import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:bkopen/loan/data/models/attribute_loan.dart';
import 'package:bkopen/loan/data/models/options_list.dart';

class CoDynamicAttributeDTO {
  final String? classname;
  final JornadaAtributoDTO? attribute;
  final String? name;
  final int? type;
  final bool? mandatory;
  final String? tooltip;
  dynamic value;
  final String? constant;
   String? sentence;
  final String? mask;
  bool? changed;
  final dynamic callBack;
  final bool? canCreateMore;
   bool? visible;
  final List<OptionsList>? optionsList;
  final String? coFilterName;
  final dynamic autoCompleteParams;
  final String? autoCompleteFieldKeyword;
  final String? autoCompleteTitle;
  final String? autoCompleteSubTitle;
  final String? groupIdentifier;
  final String? father;
  CoDynamicAttributeDTO({
    this.classname,
    this.attribute,
    this.name,
    this.type,
    this.mandatory,
    this.tooltip,
    required this.value,
    this.constant,
    this.sentence,
    this.mask,
    this.changed,
    required this.callBack,
    this.canCreateMore,
    this.visible,
    this.optionsList,
    this.coFilterName,
    required this.autoCompleteParams,
    this.autoCompleteFieldKeyword,
    this.autoCompleteTitle,
    this.autoCompleteSubTitle,
    this.groupIdentifier,
    this.father,
  });

  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'attribute': attribute?.toMap(),
      'name': name,
      'type': type,
      'mandatory': mandatory,
      'tooltip': tooltip,
      'value': value,
      'constant': constant,
      'sentence': sentence,
      'mask': mask,
      'changed': changed,
      'callBack': callBack,
      'canCreateMore': canCreateMore,
      'visible': visible,
      'optionsList': optionsList?.map((x) => x.toMap()).toList(),
      'coFilterName': coFilterName,
      'autoCompleteParams': autoCompleteParams,
      'autoCompleteFieldKeyword': autoCompleteFieldKeyword,
      'autoCompleteTitle': autoCompleteTitle,
      'autoCompleteSubTitle': autoCompleteSubTitle,
      'groupIdentifier': groupIdentifier,
      'father': father,
    };
  }

  factory CoDynamicAttributeDTO.fromMap(Map<String, dynamic> map) {
    return CoDynamicAttributeDTO(
      classname: map['classname'],
      attribute: map['attribute'] != null ? JornadaAtributoDTO.fromMap(map['attribute']) : null,
      name: map['name'],
      type: map['type']?.toInt(),
      mandatory: map['mandatory'],
      tooltip: map['tooltip'],
      value: map['value'],
      constant: map['constant'],
      sentence: map['sentence'],
      mask: map['mask'],
      changed: map['changed'],
      callBack: map['callBack'],
      canCreateMore: map['canCreateMore'],
      visible: map['visible'],
      optionsList: map['optionsList'] != null ? List<OptionsList>.from(map['optionsList']?.map((x) => OptionsList.fromMap(x))) : null,
      coFilterName: map['coFilterName'],
      autoCompleteParams: map['autoCompleteParams'],
      autoCompleteFieldKeyword: map['autoCompleteFieldKeyword'],
      autoCompleteTitle: map['autoCompleteTitle'],
      autoCompleteSubTitle: map['autoCompleteSubTitle'],
      groupIdentifier: map['groupIdentifier'],
      father: map['father'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoDynamicAttributeDTO.fromJson(String source) => CoDynamicAttributeDTO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoDynamicAttributeDTO(classname: $classname, attribute: $attribute, name: $name, type: $type, mandatory: $mandatory, tooltip: $tooltip, value: $value, constant: $constant, sentence: $sentence, mask: $mask, changed: $changed, callBack: $callBack, canCreateMore: $canCreateMore, visible: $visible, optionsList: $optionsList, coFilterName: $coFilterName, autoCompleteParams: $autoCompleteParams, autoCompleteFieldKeyword: $autoCompleteFieldKeyword, autoCompleteTitle: $autoCompleteTitle, autoCompleteSubTitle: $autoCompleteSubTitle, groupIdentifier: $groupIdentifier, father: $father)';
  }

  CoDynamicAttributeDTO copyWith({
    ValueGetter<String?>? classname,
    ValueGetter<JornadaAtributoDTO?>? attribute,
    ValueGetter<String?>? name,
    ValueGetter<int?>? type,
    ValueGetter<bool?>? mandatory,
    ValueGetter<String?>? tooltip,
    dynamic value,
    ValueGetter<String?>? constant,
    ValueGetter<String?>? sentence,
    ValueGetter<String?>? mask,
    ValueGetter<bool?>? changed,
    dynamic callBack,
    ValueGetter<bool?>? canCreateMore,
    ValueGetter<bool?>? visible,
    ValueGetter<List<OptionsList>?>? optionsList,
    ValueGetter<String?>? coFilterName,
    dynamic autoCompleteParams,
    ValueGetter<String?>? autoCompleteFieldKeyword,
    ValueGetter<String?>? autoCompleteTitle,
    ValueGetter<String?>? autoCompleteSubTitle,
    ValueGetter<String?>? groupIdentifier,
    ValueGetter<String?>? father,
  }) {
    return CoDynamicAttributeDTO(
      classname: classname != null ? classname() : this.classname,
      attribute: attribute != null ? attribute() : this.attribute,
      name: name != null ? name() : this.name,
      type: type != null ? type() : this.type,
      mandatory: mandatory != null ? mandatory() : this.mandatory,
      tooltip: tooltip != null ? tooltip() : this.tooltip,
      value: value ?? this.value,
      constant: constant != null ? constant() : this.constant,
      sentence: sentence != null ? sentence() : this.sentence,
      mask: mask != null ? mask() : this.mask,
      changed: changed != null ? changed() : this.changed,
      callBack: callBack ?? this.callBack,
      canCreateMore: canCreateMore != null ? canCreateMore() : this.canCreateMore,
      visible: visible != null ? visible() : this.visible,
      optionsList: optionsList != null ? optionsList() : this.optionsList,
      coFilterName: coFilterName != null ? coFilterName() : this.coFilterName,
      autoCompleteParams: autoCompleteParams ?? this.autoCompleteParams,
      autoCompleteFieldKeyword: autoCompleteFieldKeyword != null ? autoCompleteFieldKeyword() : this.autoCompleteFieldKeyword,
      autoCompleteTitle: autoCompleteTitle != null ? autoCompleteTitle() : this.autoCompleteTitle,
      autoCompleteSubTitle: autoCompleteSubTitle != null ? autoCompleteSubTitle() : this.autoCompleteSubTitle,
      groupIdentifier: groupIdentifier != null ? groupIdentifier() : this.groupIdentifier,
      father: father != null ? father() : this.father,
    );
  }
}
