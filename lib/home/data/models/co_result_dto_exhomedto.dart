// To parse this JSON data, do
//
//     final coResultDtoHomeload = coResultDtoHomeloadFromMap(jsonString);

import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';

CoResultDtoHomeload coResultDtoHomeloadFromMap(String str) => CoResultDtoHomeload.fromMap(json.decode(str));

String coResultDtoHomeloadToMap(CoResultDtoHomeload data) => json.encode(data.toMap());

class CoResultDtoHomeload {
    final String? classname;
    final ExHomeDto? data;
    final bool? withError;
    final List<ComessageList>? comessageList;

    CoResultDtoHomeload({
        this.classname,
        this.data,
        this.withError,
        this.comessageList,
    });

    factory CoResultDtoHomeload.fromMap(Map<String, dynamic> json) => CoResultDtoHomeload(
        classname: json["classname"],
        data: json["ExHomeDTO"] == null ? null : ExHomeDto.fromMap(json["ExHomeDTO"]),
        withError: json["withError"],
        comessageList: json['comessageList'] == null ? null: List<ComessageList>.from((json['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),),
    );

    Map<String, dynamic> toMap() => {
        "classname": classname,
        "ExHomeDTO": data?.toMap(),
        "withError": withError,
        "comessageList": comessageList == null ? [] : List<dynamic>.from(comessageList!.map((x) => x)),
    };
}

class ExHomeDto {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final List<JornadaDTO>? coUltimasJornadas;
    final int? propostasAndamento;
    final int? propostasNegociacao;
    final int? propostasFinalizadas;
    final int? totalPropostas;

    ExHomeDto({
        this.classname = "ExHomeDTO",
        this.id,
        this.created,
        this.updated,
        this.couseridcre,
        this.couseridupd,
        this.coUltimasJornadas,
        this.propostasAndamento,
        this.propostasNegociacao,
        this.propostasFinalizadas,
        this.totalPropostas,
    });

    factory ExHomeDto.fromMap(Map<String, dynamic> json) => ExHomeDto(
        classname: json["classname"],
        id: json["id"],
        created: json["created"],
        updated: json["updated"],
        couseridcre: json["couseridcre"],
        couseridupd: json["couseridupd"],
        coUltimasJornadas: json["coUltimasJornadas"] == null ? [] : List<JornadaDTO>.from(json["coUltimasJornadas"]!.map((x) => JornadaDTO.fromMap(x))),
        propostasAndamento: json["propostasAndamento"],
        propostasNegociacao: json["propostasNegociacao"],
        propostasFinalizadas: json["propostasFinalizadas"],
        totalPropostas: json["totalPropostas"],
    );

    Map<String, dynamic> toMap() => {
        "classname": classname,
        "id": id,
        "created": created,
        "updated": updated,
        "couseridcre": couseridcre,
        "couseridupd": couseridupd,
        "coUltimasJornadas": coUltimasJornadas == null ? [] : List<dynamic>.from(coUltimasJornadas!.map((x) => x.toMap())),
        "propostasAndamento": propostasAndamento,
        "propostasNegociacao": propostasNegociacao,
        "propostasFinalizadas": propostasFinalizadas,
        "totalPropostas": totalPropostas,
    };
}
