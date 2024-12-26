// ignore_for_file: public_member_api_docs, sort_constructors_first






import 'dart:convert';

import 'package:bkopen/onboarding/data/models/coclient_dto.dart';

import '../../../auth/data/models/comessage_list.dart';


class CoResultDtoCoclient {
    final String classname;
    final CoclientDto? data;
    final bool? withError;
    final List<ComessageList>? comessageList;
  CoResultDtoCoclient({
    this.classname = "CoResultDTO",
    this.data,
    this.withError,
    this.comessageList,
  });

  


  @override
  String toString() {
    return 'CoResultDtoCoclient(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.toMap(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultDtoCoclient.fromMap(Map<String, dynamic> map) {
    return CoResultDtoCoclient(
      classname: map['classname'] as String,
      data: map['data'] != null ? CoclientDto.fromMap(map['data'] as Map<String,dynamic>) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoCoclient.fromJson(String source) => CoResultDtoCoclient.fromMap(json.decode(source) as Map<String, dynamic>);
}


