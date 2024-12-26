// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultoClient = coResultoClientFromMap(jsonString);

import 'dart:convert';

import 'package:bkopen/auth/data/models/comessage_list.dart';

class CoResultoClient {
    final String? classname;
    final List<ClienteDto>? data;
    final bool? withError;
    final List<ComessageList>? comessageList;

    CoResultoClient({
        this.classname,
        this.data,
        this.withError,
        this.comessageList,
    });

 

  @override
  String toString() {
    return 'CoResultoClient(classname: $classname, data: $data, withError: $withError, comessageList: $comessageList)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'data': data?.map((x) => x.toMap()).toList(),
      'withError': withError,
      'comessageList': comessageList?.map((x) => x.toMap()).toList(),
    };
  }

  factory CoResultoClient.fromMap(Map<String, dynamic> map) {
    return CoResultoClient(
      classname: map['classname'] != null ? map['classname'] as String : null,
      data: map['data'] != null ? List<ClienteDto>.from((map['data'] as List<dynamic>).map<ClienteDto?>((x) => ClienteDto.fromMap(x as Map<String,dynamic>),),) : null,
      withError: map['withError'] != null ? map['withError'] as bool : null,
      comessageList: map['comessageList'] != null ? List<ComessageList>.from((map['comessageList'] as List<dynamic>).map<ComessageList?>((x) => ComessageList.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoResultoClient.fromJson(String source) => CoResultoClient.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ClienteDto {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final int? pessoaId;
    final String? viewnamePessoa;
    final String? viewpessoaId;
    final String? viewdocumento;
    final PessoaDto? pessoaDto;
    final String? viewpersonalidade;
    final String? viewestado;
    final String? viewsituacao;
    final String? biClientId;
    final String? viewbiClientId;
    final String? email;
    final String? cellphone;
  ClienteDto({
    this.classname,
    this.id,
    this.created,
    this.updated,
    this.couseridcre,
    this.couseridupd,
    this.pessoaId,
    this.viewnamePessoa,
    this.viewpessoaId,
    this.viewdocumento,
    this.pessoaDto,
    this.viewpersonalidade,
    this.viewestado,
    this.viewsituacao,
    this.biClientId,
    this.viewbiClientId,
    this.email,
    this.cellphone,
  });

   

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'pessoaId': pessoaId,
      'viewnamePessoa': viewnamePessoa,
      'viewpessoaId': viewpessoaId,
      'viewdocumento': viewdocumento,
      'pessoaDto': pessoaDto?.toMap(),
      'viewpersonalidade': viewpersonalidade,
      'viewestado': viewestado,
      'viewsituacao': viewsituacao,
      'biClientId': biClientId,
      'viewbiClientId': viewbiClientId,
      'email': email,
      'cellphone': cellphone,
    };
  }

  factory ClienteDto.fromMap(Map<String, dynamic> map) {
    return ClienteDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre: map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd: map['couseridupd'] != null ? map['couseridupd'] as int : null,
      pessoaId: map['pessoaId'] != null ? map['pessoaId'] as int : null,
      viewnamePessoa: map['viewnamePessoa'] != null ? map['viewnamePessoa'] as String : null,
      viewpessoaId: map['viewpessoaId'] != null ? map['viewpessoaId'] as String : null,
      viewdocumento: map['viewdocumento'] != null ? map['viewdocumento'] as String : null,
      pessoaDto: map['pessoaDto'] != null ? PessoaDto.fromMap(map['pessoaDto'] as Map<String,dynamic>) : null,
      viewpersonalidade: map['viewpersonalidade'] != null ? map['viewpersonalidade'] as String : null,
      viewestado: map['viewestado'] != null ? map['viewestado'] as String : null,
      viewsituacao: map['viewsituacao'] != null ? map['viewsituacao'] as String : null,
      biClientId: map['biClientId'] != null ? map['biClientId'] as String : null,
      viewbiClientId: map['viewbiClientId'] != null ? map['viewbiClientId'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      cellphone: map['cellphone'] != null ? map['cellphone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClienteDto.fromJson(String source) => ClienteDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClienteDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, pessoaId: $pessoaId, viewnamePessoa: $viewnamePessoa, viewpessoaId: $viewpessoaId, viewdocumento: $viewdocumento, pessoaDto: $pessoaDto, viewpersonalidade: $viewpersonalidade, viewestado: $viewestado, viewsituacao: $viewsituacao, biClientId: $biClientId, viewbiClientId: $viewbiClientId, email: $email, cellphone: $cellphone)';
  }
}

class PessoaDto {
    final String? classname;
    final int? id;
    final String? created;
    final String? updated;
    final int? couseridcre;
    final int? couseridupd;
    final String? nome;
    final int? personalidade;
    final String? documento;
    final String? viewdocumento;
    final int? situacao;
    final int? estado;
    final String? email;
    final String? telefone;
    final String? dataPersonalidade;
    final int? vlrDivida;
    final int? couserId;
    final String? viewcouserId;
    final int? couserIncluidoId;
    final String? viewcouserIncluidoId;
    final int? coCultureId;
    final String? viewcoCultureId;
    final String? viewendereco;
    final String? viewcontaCorrente;
    final String? viewpix;
    final String? viewtelefone;
    final String? temClienteCadastrado;
    final String? naturalidade;
    final int? rendaFamiliar;
    final String? tabelaRegimeBensId;
    final String? tabelaGeneroId;
    final int? tabelaNacionalidadeId;
    final int? tabelaSituacaoProfissionalId;
    final int? tabelaGrauInstrucaoId;
    final int? tabelaEstadoCivilId;
    final String? viewtabelaRegimeBensId;
    final String? viewtabelaGeneroId;
    final String? viewtabelaNacionalidadeId;
    final String? viewtabelaSituacaoProfissionalId;
    final String? viewtabelaGrauInstrucaoId;
    final String? viewtabelaEstadoCivilId;
    final String? viewidentidade;
    final String? viewpersonalidade;
    final String? viewsituacao;
    final String? viewestado;

    PessoaDto({
        this.classname,
        this.id,
        this.created,
        this.updated,
        this.couseridcre,
        this.couseridupd,
        this.nome,
        this.personalidade,
        this.documento,
        this.viewdocumento,
        this.situacao,
        this.estado,
        this.email,
        this.telefone,
        this.dataPersonalidade,
        this.vlrDivida,
        this.couserId,
        this.viewcouserId,
        this.couserIncluidoId,
        this.viewcouserIncluidoId,
        this.coCultureId,
        this.viewcoCultureId,
        this.viewendereco,
        this.viewcontaCorrente,
        this.viewpix,
        this.viewtelefone,
        this.temClienteCadastrado,
        this.naturalidade,
        this.rendaFamiliar,
        this.tabelaRegimeBensId,
        this.tabelaGeneroId,
        this.tabelaNacionalidadeId,
        this.tabelaSituacaoProfissionalId,
        this.tabelaGrauInstrucaoId,
        this.tabelaEstadoCivilId,
        this.viewtabelaRegimeBensId,
        this.viewtabelaGeneroId,
        this.viewtabelaNacionalidadeId,
        this.viewtabelaSituacaoProfissionalId,
        this.viewtabelaGrauInstrucaoId,
        this.viewtabelaEstadoCivilId,
        this.viewidentidade,
        this.viewpersonalidade,
        this.viewsituacao,
        this.viewestado,
    });


  @override
  String toString() {
    return 'PessoaDto(classname: $classname, id: $id, created: $created, updated: $updated, couseridcre: $couseridcre, couseridupd: $couseridupd, nome: $nome, personalidade: $personalidade, documento: $documento, viewdocumento: $viewdocumento, situacao: $situacao, estado: $estado, email: $email, telefone: $telefone, dataPersonalidade: $dataPersonalidade, vlrDivida: $vlrDivida, couserId: $couserId, viewcouserId: $viewcouserId, couserIncluidoId: $couserIncluidoId, viewcouserIncluidoId: $viewcouserIncluidoId, coCultureId: $coCultureId, viewcoCultureId: $viewcoCultureId, viewendereco: $viewendereco, viewcontaCorrente: $viewcontaCorrente, viewpix: $viewpix, viewtelefone: $viewtelefone, temClienteCadastrado: $temClienteCadastrado, naturalidade: $naturalidade, rendaFamiliar: $rendaFamiliar, tabelaRegimeBensId: $tabelaRegimeBensId, tabelaGeneroId: $tabelaGeneroId, tabelaNacionalidadeId: $tabelaNacionalidadeId, tabelaSituacaoProfissionalId: $tabelaSituacaoProfissionalId, tabelaGrauInstrucaoId: $tabelaGrauInstrucaoId, tabelaEstadoCivilId: $tabelaEstadoCivilId, viewtabelaRegimeBensId: $viewtabelaRegimeBensId, viewtabelaGeneroId: $viewtabelaGeneroId, viewtabelaNacionalidadeId: $viewtabelaNacionalidadeId, viewtabelaSituacaoProfissionalId: $viewtabelaSituacaoProfissionalId, viewtabelaGrauInstrucaoId: $viewtabelaGrauInstrucaoId, viewtabelaEstadoCivilId: $viewtabelaEstadoCivilId, viewidentidade: $viewidentidade, viewpersonalidade: $viewpersonalidade, viewsituacao: $viewsituacao, viewestado: $viewestado)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'id': id,
      'created': created,
      'updated': updated,
      'couseridcre': couseridcre,
      'couseridupd': couseridupd,
      'nome': nome,
      'personalidade': personalidade,
      'documento': documento,
      'viewdocumento': viewdocumento,
      'situacao': situacao,
      'estado': estado,
      'email': email,
      'telefone': telefone,
      'dataPersonalidade': dataPersonalidade,
      'vlrDivida': vlrDivida,
      'couserId': couserId,
      'viewcouserId': viewcouserId,
      'couserIncluidoId': couserIncluidoId,
      'viewcouserIncluidoId': viewcouserIncluidoId,
      'coCultureId': coCultureId,
      'viewcoCultureId': viewcoCultureId,
      'viewendereco': viewendereco,
      'viewcontaCorrente': viewcontaCorrente,
      'viewpix': viewpix,
      'viewtelefone': viewtelefone,
      'temClienteCadastrado': temClienteCadastrado,
      'naturalidade': naturalidade,
      'rendaFamiliar': rendaFamiliar,
      'tabelaRegimeBensId': tabelaRegimeBensId,
      'tabelaGeneroId': tabelaGeneroId,
      'tabelaNacionalidadeId': tabelaNacionalidadeId,
      'tabelaSituacaoProfissionalId': tabelaSituacaoProfissionalId,
      'tabelaGrauInstrucaoId': tabelaGrauInstrucaoId,
      'tabelaEstadoCivilId': tabelaEstadoCivilId,
      'viewtabelaRegimeBensId': viewtabelaRegimeBensId,
      'viewtabelaGeneroId': viewtabelaGeneroId,
      'viewtabelaNacionalidadeId': viewtabelaNacionalidadeId,
      'viewtabelaSituacaoProfissionalId': viewtabelaSituacaoProfissionalId,
      'viewtabelaGrauInstrucaoId': viewtabelaGrauInstrucaoId,
      'viewtabelaEstadoCivilId': viewtabelaEstadoCivilId,
      'viewidentidade': viewidentidade,
      'viewpersonalidade': viewpersonalidade,
      'viewsituacao': viewsituacao,
      'viewestado': viewestado,
    };
  }

  factory PessoaDto.fromMap(Map<String, dynamic> map) {
    return PessoaDto(
      classname: map['classname'] != null ? map['classname'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      created: map['created'] != null ? map['created'] as String : null,
      updated: map['updated'] != null ? map['updated'] as String : null,
      couseridcre: map['couseridcre'] != null ? map['couseridcre'] as int : null,
      couseridupd: map['couseridupd'] != null ? map['couseridupd'] as int : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      personalidade: map['personalidade'] != null ? map['personalidade'] as int : null,
      documento: map['documento'] != null ? map['documento'] as String : null,
      viewdocumento: map['viewdocumento'] != null ? map['viewdocumento'] as String : null,
      situacao: map['situacao'] != null ? map['situacao'] as int : null,
      estado: map['estado'] != null ? map['estado'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      telefone: map['telefone'] != null ? map['telefone'] as String : null,
      dataPersonalidade: map['dataPersonalidade'] != null ? map['dataPersonalidade'] as String : null,
      vlrDivida: map['vlrDivida'] != null ? map['vlrDivida'] as int : null,
      couserId: map['couserId'] != null ? map['couserId'] as int : null,
      viewcouserId: map['viewcouserId'] != null ? map['viewcouserId'] as String : null,
      couserIncluidoId: map['couserIncluidoId'] != null ? map['couserIncluidoId'] as int : null,
      viewcouserIncluidoId: map['viewcouserIncluidoId'] != null ? map['viewcouserIncluidoId'] as String : null,
      coCultureId: map['coCultureId'] != null ? map['coCultureId'] as int : null,
      viewcoCultureId: map['viewcoCultureId'] != null ? map['viewcoCultureId'] as String : null,
      viewendereco: map['viewendereco'] != null ? map['viewendereco'] as String : null,
      viewcontaCorrente: map['viewcontaCorrente'] != null ? map['viewcontaCorrente'] as String : null,
      viewpix: map['viewpix'] != null ? map['viewpix'] as String : null,
      viewtelefone: map['viewtelefone'] != null ? map['viewtelefone'] as String : null,
      temClienteCadastrado: map['temClienteCadastrado'] != null ? map['temClienteCadastrado'] as String : null,
      naturalidade: map['naturalidade'] != null ? map['naturalidade'] as String : null,
      rendaFamiliar: map['rendaFamiliar'] != null ? map['rendaFamiliar'] as int : null,
      tabelaRegimeBensId: map['tabelaRegimeBensId'] != null ? map['tabelaRegimeBensId'] as String : null,
      tabelaGeneroId: map['tabelaGeneroId'] != null ? map['tabelaGeneroId'] as String : null,
      tabelaNacionalidadeId: map['tabelaNacionalidadeId'] != null ? map['tabelaNacionalidadeId'] as int : null,
      tabelaSituacaoProfissionalId: map['tabelaSituacaoProfissionalId'] != null ? map['tabelaSituacaoProfissionalId'] as int : null,
      tabelaGrauInstrucaoId: map['tabelaGrauInstrucaoId'] != null ? map['tabelaGrauInstrucaoId'] as int : null,
      tabelaEstadoCivilId: map['tabelaEstadoCivilId'] != null ? map['tabelaEstadoCivilId'] as int : null,
      viewtabelaRegimeBensId: map['viewtabelaRegimeBensId'] != null ? map['viewtabelaRegimeBensId'] as String : null,
      viewtabelaGeneroId: map['viewtabelaGeneroId'] != null ? map['viewtabelaGeneroId'] as String : null,
      viewtabelaNacionalidadeId: map['viewtabelaNacionalidadeId'] != null ? map['viewtabelaNacionalidadeId'] as String : null,
      viewtabelaSituacaoProfissionalId: map['viewtabelaSituacaoProfissionalId'] != null ? map['viewtabelaSituacaoProfissionalId'] as String : null,
      viewtabelaGrauInstrucaoId: map['viewtabelaGrauInstrucaoId'] != null ? map['viewtabelaGrauInstrucaoId'] as String : null,
      viewtabelaEstadoCivilId: map['viewtabelaEstadoCivilId'] != null ? map['viewtabelaEstadoCivilId'] as String : null,
      viewidentidade: map['viewidentidade'] != null ? map['viewidentidade'] as String : null,
      viewpersonalidade: map['viewpersonalidade'] != null ? map['viewpersonalidade'] as String : null,
      viewsituacao: map['viewsituacao'] != null ? map['viewsituacao'] as String : null,
      viewestado: map['viewestado'] != null ? map['viewestado'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PessoaDto.fromJson(String source) => PessoaDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
