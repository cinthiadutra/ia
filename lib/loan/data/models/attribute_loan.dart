// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultDtoFields = coResultDtoFieldsFromMap(jsonString);

import 'package:bkopen/loan/data/models/options_list.dart';

class JornadaAtributoDTO {
    final String? classname;
    final int? id;
    final String? created;
    final String?  updated;
    final int? couseridcre;
    final int?  couseridupd;
    final String?  valor;
    final String? viewvalor;
    final String? ocorrencia;
    final bool? restricao;
    final bool? obrigatorio;
    final int? tipoAtributo;
    final int? fluxoAtributoProdutoId;
    final int? responsabilidadeAtributoProdutoId;
    final int? escolha;
     bool? visible;
    final int? jornadaId;
    final String? viewjornadaId;
    final int? atributoProdutoId;
    final String? viewatributoProdutoId;
    final int? jornadaEtapaId;
    final String? viewjornadaEtapaId;
    final String?  jornadaArquivoId;
    final String?  viewjornadaArquivoId;
    final String?  coFilejornadaArquivoId;
     List<OptionsList>? opcoes;
    final String?  jornadaAtributoOrigemId;
    final String?  viewjornadaAtributoOrigemId;
    final int?  grupoAtributoProdutoId;
    final String?  viewgrupoAtributoProdutoId;
    final String?  coFilterName;
    final dynamic  autoCompleteParams;
    final String?  autoCompleteFieldKeyword;
    final String?  autoCompleteTitle;
    final String?  autoCompleteSubTitle;
    final String? viewtipoAtributo;
    final String? viewescolha;
    final String? viewfluxoAtributoProdutoId;
    final String? viewresponsabilidadeAtributoProdutoId;

    JornadaAtributoDTO({
        this.classname,
        this.id,
        this.created,
        this.updated,
        this.couseridcre,
        this.couseridupd,
        this.valor,
        this.viewvalor,
        this.ocorrencia,
        this.restricao,
        this.obrigatorio,
        this.tipoAtributo,
        this.fluxoAtributoProdutoId,
        this.responsabilidadeAtributoProdutoId,
        this.escolha,
        this.visible,
        this.jornadaId,
        this.viewjornadaId,
        this.atributoProdutoId,
        this.viewatributoProdutoId,
        this.jornadaEtapaId,
        this.viewjornadaEtapaId,
        this.jornadaArquivoId,
        this.viewjornadaArquivoId,
        this.coFilejornadaArquivoId,
        this.opcoes,
        this.jornadaAtributoOrigemId,
        this.viewjornadaAtributoOrigemId,
        this.grupoAtributoProdutoId,
        this.viewgrupoAtributoProdutoId,
        this.coFilterName,
        this.autoCompleteParams,
        this.autoCompleteFieldKeyword,
        this.autoCompleteTitle,
        this.autoCompleteSubTitle,
        this.viewtipoAtributo,
        this.viewescolha,
        this.viewfluxoAtributoProdutoId,
        this.viewresponsabilidadeAtributoProdutoId,
    });

    factory JornadaAtributoDTO.fromMap(Map<String, dynamic> json) => JornadaAtributoDTO(
        classname: json["classname"],
        id: json["id"],
        created: json["created"],
        updated: json["updated"],
        couseridcre: json["couseridcre"],
        couseridupd: json["couseridupd"],
        valor: json["valor"],
        viewvalor: json["viewvalor"],
        ocorrencia: json["ocorrencia"],
        restricao: json["restricao"],
        obrigatorio: json["obrigatorio"],
        tipoAtributo: json["tipoAtributo"],
        fluxoAtributoProdutoId: json["fluxoAtributoProdutoId"],
        responsabilidadeAtributoProdutoId: json["responsabilidadeAtributoProdutoId"],
        escolha: json["escolha"],
        visible: json["visible"],
        jornadaId: json["jornadaId"],
        viewjornadaId: json["viewjornadaId"],
        atributoProdutoId: json["atributoProdutoId"],
        viewatributoProdutoId: json["viewatributoProdutoId"],
        jornadaEtapaId: json["jornadaEtapaId"],
        viewjornadaEtapaId: json["viewjornadaEtapaId"],
        jornadaArquivoId: json["jornadaArquivoId"],
        viewjornadaArquivoId: json["viewjornadaArquivoId"],
        coFilejornadaArquivoId: json["coFilejornadaArquivoId"],
        opcoes: json["opcoes"] == null ? [] : List<OptionsList>.from(json["opcoes"]!.map((x) => OptionsList.fromMap(x))),
        jornadaAtributoOrigemId: json["jornadaAtributoOrigemId"],
        viewjornadaAtributoOrigemId: json["viewjornadaAtributoOrigemId"],
        grupoAtributoProdutoId: json["grupoAtributoProdutoId"],
        viewgrupoAtributoProdutoId: json["viewgrupoAtributoProdutoId"],
        coFilterName: json["coFilterName"],
        autoCompleteParams: json["autoCompleteParams"],
        autoCompleteFieldKeyword: json["autoCompleteFieldKeyword"],
        autoCompleteTitle: json["autoCompleteTitle"],
        autoCompleteSubTitle: json["autoCompleteSubTitle"],
        viewtipoAtributo: json["viewtipoAtributo"],
        viewescolha: json["viewescolha"],
        viewfluxoAtributoProdutoId: json["viewfluxoAtributoProdutoId"],
        viewresponsabilidadeAtributoProdutoId: json["viewresponsabilidadeAtributoProdutoId"],
    );

    Map<String, dynamic> toMap() => {
        "classname": classname,
        "id": id,
        "created": created,
        "updated": updated,
        "couseridcre": couseridcre,
        "couseridupd": couseridupd,
        "valor": valor,
        "viewvalor": viewvalor,
        "ocorrencia": ocorrencia,
        "restricao": restricao,
        "obrigatorio": obrigatorio,
        "tipoAtributo": tipoAtributo,
        "fluxoAtributoProdutoId": fluxoAtributoProdutoId,
        "responsabilidadeAtributoProdutoId": responsabilidadeAtributoProdutoId,
        "escolha": escolha,
        "visible": visible,
        "jornadaId": jornadaId,
        "viewjornadaId": viewjornadaId,
        "atributoProdutoId": atributoProdutoId,
        "viewatributoProdutoId": viewatributoProdutoId,
        "jornadaEtapaId": jornadaEtapaId,
        "viewjornadaEtapaId": viewjornadaEtapaId,
        "jornadaArquivoId": jornadaArquivoId,
        "viewjornadaArquivoId": viewjornadaArquivoId,
        "coFilejornadaArquivoId": coFilejornadaArquivoId,
        "opcoes": opcoes == null ? [] : List<dynamic>.from(opcoes!.map((x) => x.toMap())),
        "jornadaAtributoOrigemId": jornadaAtributoOrigemId,
        "viewjornadaAtributoOrigemId": viewjornadaAtributoOrigemId,
        "grupoAtributoProdutoId": grupoAtributoProdutoId,
        "viewgrupoAtributoProdutoId": viewgrupoAtributoProdutoId,
        "coFilterName": coFilterName,
        "autoCompleteParams": autoCompleteParams,
        "autoCompleteFieldKeyword": autoCompleteFieldKeyword,
        "autoCompleteTitle": autoCompleteTitle,
        "autoCompleteSubTitle": autoCompleteSubTitle,
        "viewtipoAtributo": viewtipoAtributo,
        "viewescolha": viewescolha,
        "viewfluxoAtributoProdutoId": viewfluxoAtributoProdutoId,
        "viewresponsabilidadeAtributoProdutoId": viewresponsabilidadeAtributoProdutoId,
    };

  JornadaAtributoDTO copyWith({
    String? classname,
    int? id,
    String? created,
    String? updated,
    int? couseridcre,
    int? couseridupd,
    String? valor,
    String? viewvalor,
    String? ocorrencia,
    bool? restricao,
    bool? obrigatorio,
    int? tipoAtributo,
    int? fluxoAtributoProdutoId,
    int? responsabilidadeAtributoProdutoId,
    int? escolha,
    bool? visible,
    int? jornadaId,
    String? viewjornadaId,
    int? atributoProdutoId,
    String? viewatributoProdutoId,
    int? jornadaEtapaId,
    String? viewjornadaEtapaId,
    String? jornadaArquivoId,
    String? viewjornadaArquivoId,
    String? coFilejornadaArquivoId,
    List<OptionsList>? opcoes,
    String? jornadaAtributoOrigemId,
    String? viewjornadaAtributoOrigemId,
    int? grupoAtributoProdutoId,
    String? viewgrupoAtributoProdutoId,
    String? coFilterName,
    dynamic autoCompleteParams,
    String? autoCompleteFieldKeyword,
    String? autoCompleteTitle,
    String? autoCompleteSubTitle,
    String? viewtipoAtributo,
    String? viewescolha,
    String? viewfluxoAtributoProdutoId,
    String? viewresponsabilidadeAtributoProdutoId,
  }) {
    return JornadaAtributoDTO(
      classname: classname ?? this.classname,
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      couseridcre: couseridcre ?? this.couseridcre,
      couseridupd: couseridupd ?? this.couseridupd,
      valor: valor ?? this.valor,
      viewvalor: viewvalor ?? this.viewvalor,
      ocorrencia: ocorrencia ?? this.ocorrencia,
      restricao: restricao ?? this.restricao,
      obrigatorio: obrigatorio ?? this.obrigatorio,
      tipoAtributo: tipoAtributo ?? this.tipoAtributo,
      fluxoAtributoProdutoId: fluxoAtributoProdutoId ?? this.fluxoAtributoProdutoId,
      responsabilidadeAtributoProdutoId: responsabilidadeAtributoProdutoId ?? this.responsabilidadeAtributoProdutoId,
      escolha: escolha ?? this.escolha,
      visible: visible ?? this.visible,
      jornadaId: jornadaId ?? this.jornadaId,
      viewjornadaId: viewjornadaId ?? this.viewjornadaId,
      atributoProdutoId: atributoProdutoId ?? this.atributoProdutoId,
      viewatributoProdutoId: viewatributoProdutoId ?? this.viewatributoProdutoId,
      jornadaEtapaId: jornadaEtapaId ?? this.jornadaEtapaId,
      viewjornadaEtapaId: viewjornadaEtapaId ?? this.viewjornadaEtapaId,
      jornadaArquivoId: jornadaArquivoId ?? this.jornadaArquivoId,
      viewjornadaArquivoId: viewjornadaArquivoId ?? this.viewjornadaArquivoId,
      coFilejornadaArquivoId: coFilejornadaArquivoId ?? this.coFilejornadaArquivoId,
      opcoes: opcoes ?? this.opcoes,
      jornadaAtributoOrigemId: jornadaAtributoOrigemId ?? this.jornadaAtributoOrigemId,
      viewjornadaAtributoOrigemId: viewjornadaAtributoOrigemId ?? this.viewjornadaAtributoOrigemId,
      grupoAtributoProdutoId: grupoAtributoProdutoId ?? this.grupoAtributoProdutoId,
      viewgrupoAtributoProdutoId: viewgrupoAtributoProdutoId ?? this.viewgrupoAtributoProdutoId,
      coFilterName: coFilterName ?? this.coFilterName,
      autoCompleteParams: autoCompleteParams ?? this.autoCompleteParams,
      autoCompleteFieldKeyword: autoCompleteFieldKeyword ?? this.autoCompleteFieldKeyword,
      autoCompleteTitle: autoCompleteTitle ?? this.autoCompleteTitle,
      autoCompleteSubTitle: autoCompleteSubTitle ?? this.autoCompleteSubTitle,
      viewtipoAtributo: viewtipoAtributo ?? this.viewtipoAtributo,
      viewescolha: viewescolha ?? this.viewescolha,
      viewfluxoAtributoProdutoId: viewfluxoAtributoProdutoId ?? this.viewfluxoAtributoProdutoId,
      viewresponsabilidadeAtributoProdutoId: viewresponsabilidadeAtributoProdutoId ?? this.viewresponsabilidadeAtributoProdutoId,
    );
  }
}
