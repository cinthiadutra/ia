// To parse this JSON data, do
//
//     final exCoWebSocketDto = exCoWebSocketDtoFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/widgets.dart';

ExCoWebSocketDto exCoWebSocketDtoFromMap(String str) => ExCoWebSocketDto.fromMap(json.decode(str));

String exCoWebSocketDtoToMap(ExCoWebSocketDto data) => json.encode(data.toMap());

class ExCoWebSocketDto {
    final String? classname;
    final String? type;
    final dynamic payload;
    final String? replyId;
    final int? id;
  ExCoWebSocketDto({
    this.classname,
    this.type,
    required this.payload,
    this.replyId,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'classname': classname,
      'type': type,
      'payload': payload,
      'replyId': replyId,
      'id': id,
    };
  }

  factory ExCoWebSocketDto.fromMap(Map<String, dynamic> map) {
    return ExCoWebSocketDto(
      classname: map['classname'],
      type: map['type'],
      payload: map['payload'],
      replyId: map['replyId'],
      id: map['id']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExCoWebSocketDto.fromJson(String source) => ExCoWebSocketDto.fromMap(json.decode(source));

  ExCoWebSocketDto copyWith({
    ValueGetter<String?>? classname,
    ValueGetter<String?>? type,
    dynamic payload,
    ValueGetter<String?>? replyId,
    ValueGetter<int?>? id,
  }) {
    return ExCoWebSocketDto(
      classname: classname != null ? classname() : this.classname,
      type: type != null ? type() : this.type,
      payload: payload ?? this.payload,
      replyId: replyId != null ? replyId() : this.replyId,
      id: id != null ? id() : this.id,
    );
  }

  @override
  String toString() {
    return 'ExCoWebSocketDto(classname: $classname, type: $type, payload: $payload, replyId: $replyId, id: $id)';
  }
}
