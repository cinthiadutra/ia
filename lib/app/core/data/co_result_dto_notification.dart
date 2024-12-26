// To parse this JSON data, do
//
//     final coResultDtoNotification = coResultDtoNotificationFromMap(jsonString);

import 'dart:convert';

import 'package:bkopen/app/core/data/ex_co_notification_dto.dart';
import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/loan/data/models/pagination.dart';

class CoResultDtoNotification {
  final String? classname;
  final List<ExCoNotificationDto>? data;
  final List<ComessageList>? coMessageList;
  final Pagination? pagination;
  final bool? withError;

  CoResultDtoNotification({
    this.classname = "CoResultDTO",
    this.data,
    this.coMessageList,
    this.pagination,
    this.withError,
  });


  @override
  String toString() {
    return 'CoResultDtoNotification(classname: $classname, data: $data, coMessageList: $coMessageList, pagination: $pagination, withError: $withError)';
  }

  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'data': data?.map((x) => x?.toMap())?.toList(),
      'coMessageList': coMessageList?.map((x) => x?.toMap())?.toList(),
      'pagination': pagination?.toMap(),
      'withError': withError,
    };
  }

  factory CoResultDtoNotification.fromMap(Map<String, dynamic> map) {
    return CoResultDtoNotification(
      classname: map['classname'],
      data: map['data'] != null ? List<ExCoNotificationDto>.from(map['data']?.map((x) => ExCoNotificationDto.fromMap(x))) : null,
      coMessageList: map['coMessageList'] != null ? List<ComessageList>.from(map['coMessageList']?.map((x) => ComessageList.fromMap(x))) : null,
      pagination: map['pagination'] != null ? Pagination.fromMap(map['pagination']) : null,
      withError: map['withError'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultDtoNotification.fromJson(String source) => CoResultDtoNotification.fromMap(json.decode(source));
}
