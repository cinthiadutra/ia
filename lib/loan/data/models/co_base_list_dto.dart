// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coBaseListDto = coBaseListDtoFromMap(jsonString);

import 'dart:convert';

import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';

CoBaseListDto coBaseListDtoFromMap(String str) => CoBaseListDto.fromMap(json.decode(str));

String coBaseListDtoToMap(CoBaseListDto data) => json.encode(data.toMap());

class CoBaseListDto {
    final String? classname;
    final List<JornadaEtapaDto>? data;

    CoBaseListDto({
        this.classname,
        this.data,
    });

    factory CoBaseListDto.fromMap(Map<String, dynamic> json) => CoBaseListDto(
        classname: json["classname"],
        data: json["data"] == null ? [] : List<JornadaEtapaDto>.from(json["data"]!.map((x) => JornadaEtapaDto.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "classname": classname,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}
