// To parse this JSON data, do
//
//     final coResultDto = coResultDtoFromMap(jsonString);

class JornadaDTO {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final int? criterio;
    final int? jornada;
    final String? ocorrencia;
    final String? simulado;
    final dynamic parceirosLiberados;
    final int? qualificacao;
    final dynamic ticket;
    final bool? restricao;
    final int? personalidade;
    final int? clienteId;
    final String? viewclienteId;
    final int? classeProdutoId;
    final String? viewclasseProdutoId;
    final int? agenteNegocioId;
    final String? viewagenteNegocioId;
    final int? agenteColaboradorId;
    final String? viewagenteColaboradorId;
    final dynamic classeSimulacaoId;
    final dynamic viewclasseSimulacaoId;
    final String? view;
    final bool? classeProdutoSimulacao;
    final String? viewclasseProduto;
    final String? viewprodutoParceiroId;
    final String? valorPretendido;
    final String? viewcriterio;
    final String? viewjornada;
    final String? viewqualificacao;
    final String? viewpersonalidade;

    JornadaDTO({
        this.classname,
        this.id,
        this.created,
        this.updated,
        this.couseridcre,
        this.couseridupd,
        this.criterio,
        this.jornada,
        this.ocorrencia,
        this.simulado,
        this.parceirosLiberados,
        this.qualificacao,
        this.ticket,
        this.restricao,
        this.personalidade,
        this.clienteId,
        this.viewclienteId,
        this.classeProdutoId,
        this.viewclasseProdutoId,
        this.agenteNegocioId,
        this.viewagenteNegocioId,
        this.agenteColaboradorId,
        this.viewagenteColaboradorId,
        this.classeSimulacaoId,
        this.viewclasseSimulacaoId,
        this.view,
        this.classeProdutoSimulacao,
        this.viewclasseProduto,
        this.viewprodutoParceiroId,
        this.valorPretendido,
        this.viewcriterio,
        this.viewjornada,
        this.viewqualificacao,
        this.viewpersonalidade,
    });

    factory JornadaDTO.fromMap(Map<String, dynamic> json) => JornadaDTO(
        classname: json["classname"],
        id: json["id"],
        created: json["created"] ,
        updated: json["updated"],
        couseridcre: json["couseridcre"],
        couseridupd: json["couseridupd"],
        criterio: json["criterio"],
        jornada: json["jornada"],
        ocorrencia: json["ocorrencia"],
        simulado: json["simulado"] ,
        parceirosLiberados: json["parceirosLiberados"],
        qualificacao: json["qualificacao"],
        ticket: json["ticket"],
        restricao: json["restricao"],
        personalidade: json["personalidade"],
        clienteId: json["clienteId"],
        viewclienteId: json["viewclienteId"],
        classeProdutoId: json["classeProdutoId"],
        viewclasseProdutoId: json["viewclasseProdutoId"],
        agenteNegocioId: json["agenteNegocioId"],
        viewagenteNegocioId: json["viewagenteNegocioId"],
        agenteColaboradorId: json["agenteColaboradorId"],
        viewagenteColaboradorId: json["viewagenteColaboradorId"],
        classeSimulacaoId: json["classeSimulacaoId"],
        viewclasseSimulacaoId: json["viewclasseSimulacaoId"],
        view: json["view"],
        classeProdutoSimulacao: json["classeProdutoSimulacao"],
        viewclasseProduto: json["viewclasseProduto"],
        viewprodutoParceiroId: json["viewprodutoParceiroId"],
        valorPretendido: json["valorPretendido"],
        viewcriterio: json["viewcriterio"],
        viewjornada: json["viewjornada"],
        viewqualificacao: json["viewqualificacao"],
        viewpersonalidade: json["viewpersonalidade"],
    );

    Map<String, dynamic> toMap() => {
        "classname": classname,
        "id": id,
        "created": created,
        "updated": updated,
        "couseridcre": couseridcre,
        "couseridupd": couseridupd,
        "criterio": criterio,
        "jornada": jornada,
        "ocorrencia": ocorrencia,
        "simulado": simulado,
        "parceirosLiberados": parceirosLiberados,
        "qualificacao": qualificacao,
        "ticket": ticket,
        "restricao": restricao,
        "personalidade": personalidade,
        "clienteId": clienteId,
        "viewclienteId": viewclienteId,
        "classeProdutoId": classeProdutoId,
        "viewclasseProdutoId": viewclasseProdutoId,
        "agenteNegocioId": agenteNegocioId,
        "viewagenteNegocioId": viewagenteNegocioId,
        "agenteColaboradorId": agenteColaboradorId,
        "viewagenteColaboradorId": viewagenteColaboradorId,
        "classeSimulacaoId": classeSimulacaoId,
        "viewclasseSimulacaoId": viewclasseSimulacaoId,
        "view": view,
        "classeProdutoSimulacao": classeProdutoSimulacao,
        "viewclasseProduto": viewclasseProduto,
        "viewprodutoParceiroId": viewprodutoParceiroId,
        "valorPretendido": valorPretendido,
        "viewcriterio": viewcriterio,
        "viewjornada": viewjornada,
        "viewqualificacao": viewqualificacao,
        "viewpersonalidade": viewpersonalidade,
    };
}
