// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:bkopen/onboarding/data/models/onboardingDTO.dart';

import '../../../auth/data/models/comessage_list.dart';

class OnboardingCoResultDTO {
  final String classname;
  final BeOnBoardingDTO? data;
  final bool? withError;
  final List<ComessageList>? comessageList;
  OnboardingCoResultDTO({
    this.classname = "CoResultDTO",
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

  factory OnboardingCoResultDTO.fromMap(Map<String, dynamic> map) {
    return OnboardingCoResultDTO(
      classname: map['classname'] as String,
      data: map['data'] != null
          ? BeOnBoardingDTO.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null
          ? List<ComessageList>.from(
              (map['comessageList'] as List<dynamic>).map<ComessageList?>(
                (x) => ComessageList.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingCoResultDTO.fromJson(String source) =>
      OnboardingCoResultDTO.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OnboardingCoResultDTO(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }
}
