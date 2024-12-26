import 'dart:developer';
import 'dart:io';

import 'package:bkopen/app/core/data/co_result_dto_hornada.dart';
import 'package:bkopen/app/services/config_app.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_parceiro.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_product.dart';
import 'package:bkopen/loan/data/models/co_base_list_dto.dart';
import 'package:bkopen/loan/data/models/co_result_dto_fields.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_atribute.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_etapa.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornadai.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:bkopen/loan/data/models/loan_exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/services/http_client/app_http.dart';
import '../../app/services/local_storage/local_storage.dart';
import '../../loan/data/models/co_result_dto_tabela.dart';

class ProposalRepository {
  final _clientAuth = AppHttp.withAuthentication().instance;
  final storage = Get.find<LocalStorage>();
  final kBaseUrl = ConfigApp.BASE_URL;

  Future<Either<LoanException, CoResultDtoJornadaEtapa>> filterJornadaEtapa(
      {required int jornadaId,required int jornada}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/jornadaetapa/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "jornada": jornada,
          "pageSize": 10,
          "jornadaId": jornadaId
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }



  ///envia o sms para o numero digitado
  Future<Either<LoanException, CoResultDtoProduct>> filterProduct(
      {required idJornada}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appcommon/produtoparceiro/filter',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "ProdutoParceiroDTO",
            "items": {
              "pageSize": 100,
              "classeProdutoId": 1,
              "verificarRestritosPelaJornada": idJornada,
              "temParceiroAtivo": true
            }
          });
      var model = CoResultDtoProduct.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoFields>> carregarAtributosDinamicos(
      List<int> ids) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appcommon/jornada/carregarAtributosDinamicos',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "JornadaEtapaDTO",
            "items": {
              "page": 0,
              "pageSize": 10,
              "ids": ids,
              "considerarEligibilidadeRestricoes": true
            }
          });
      var model = CoResultDtoFields.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  /// Salva um ou vários atributos dinâmicos dentro de cada CoDynamicSectionDto.
  Future<Either<LoanException, CoResultDtoFields>> salvarAtributosDinamicos({
    required CoDynamicFieldsDto fields, // Lista de seções a serem enviadas
  }) async {
    try {
      // Converter cada seção e seus atributos dinâmicos para um Map

      // Envia a lista de seções com seus respectivos atributos no corpo da requisição
      final response = await _clientAuth.post(
        '${kBaseUrl}appcommon/jornada/salvarAtributosDinamicos',
        options: Options(headers: {
          'application': 'bcc', // Pode ser personalizado conforme a necessidade
          'locale': 'pt'
        }),
        data: fields
            .toMap(), // Envia os dados das seções com os atributos dinâmicos
      );

      // Parse da resposta para o modelo CoResultDtoFields
      final model = CoResultDtoFields.fromMap(response.data);
      log(model.toString()); // Log para debugar a resposta
      return Right(model);
    } on DioException catch (e) {
      // Log do erro específico da biblioteca Dio
      log('DioError: ${e.message}');
      return Left(LoanExceptionGeneric(message: e.message));
    } catch (e) {
      // Log de qualquer outro erro genérico
      log('Error: ${e.toString()}');
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoJornadaEtapa>> avancarEtapas(
      {required CoBaseListDto request}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appcommon/jornadaetapa/avancarEtapas',
          data: request.toMap());
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoJornadaI>> simularJornada(
      {required int jornadaId, required int criterio}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/simulador/simularJornada', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "pageSize": 10,
          "criterio": criterio,
          "jornadaId": jornadaId
        },
        "pageSize": 10,
        "queryName": "JornadaDTO",
        "sendPage": true
      });
      var model = CoResultDtoJornadaI.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoJornadaEtapa>>
      filterJornadaEtapaPropostas(
          {required int jornadaId,
          required int jornada,
          required int clienteId}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/jornadaetapa/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "considerarEligibilidadeRestricoes": true,
          "jornada": jornada,
          "jornadaId": jornadaId,
          "page": 0,
          "pageSize": 10,
          "temAgenteParceiro": true,
          "trazerAtributosSaida": true,
          "trazerExplicativoRestricoes": true,
        },
        "queryName": "JornadaEtapaDTO"
      });
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoTabela>> filterTabela(
      {required String nome}) async {
    try {
      var resp =
          await _clientAuth.post('${kBaseUrl}appcommon/tabela/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "tipoTabelaId": 41,
          "ativo": true,
          "nome": nome,
          "pageSize": 10,
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoTabela.fromMap(resp.data);
      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoJornada>> filterJornadaUser(
      {required int clienteId}) async {
    try {
      var resp =
          await _clientAuth.post('${kBaseUrl}appcommon/jornada/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "agenteNegocioId": 3,
          "pageSize": 10,
          "trazerValorPretendido": true,
          "clienteId": clienteId
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoJornada.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoJornadaEtapa>> filterJornadaUserEtapa(
      {required int jornadaEtapaId}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/jornadaetapa/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "considerarEligibilidadeRestricoes": true,
          "pageSize": 100,
          "trazerUltimasEtapaPorJornadaEAgenteParceiro": true,
          "trazerExplicativoRestricoes": true,
          "trazerRestricaoConsiderandoJornada": true,
          "idIn": [jornadaEtapaId]
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }



Future<Either<LoanException, File>> baixarResumoJornada({
  required int jornadaId,
}) async {
  try {
    // Faz a requisição HTTP
    final resp = await _clientAuth.post(
      '${kBaseUrl}appcommon/jornada/gerarResumoJornada',
      data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "pageSize": 10,
          "id": jornadaId,
          "queryName": "JornadaDTO",
        },
        "queryName": "JornadaDTO",
      },
      options: Options(
        responseType: ResponseType.bytes, // Receber os bytes diretamente
      ),
    );

    // Obter o diretório da pasta Downloads
   Directory? directory = Platform.isAndroid
    ? await getExternalStorageDirectory() //FOR ANDROID
    : await getApplicationSupportDirectory();
    if (directory == null) {
      return Left(LoanExceptionGeneric(message: "Não foi possível acessar a pasta Downloads."));
    }

    // Caminho completo do arquivo
    final filePath = "${directory.path}/resumo_jornada_$jornadaId.pdf";

    // Criação do arquivo na pasta Downloads
    final file = File(filePath);
    await file.writeAsBytes(resp.data);

    // Retorna o arquivo salvo
    return Right(file);
  } catch (e) {
    log(e.toString());
    return Left(LoanExceptionGeneric(message: e.toString()));
  }
}



  Future<Either<LoanException, CoResultDtoJornadaAtribute>> simulacaoDetail(
      {required JornadaEtapaDto request}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appcommon/jornadaetapa/memoriacalculo',
          data: request.toMap());
      var model = CoResultDtoJornadaAtribute.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoParceiro>> filterParceiro(
      {required int id, required int agenteParceiroId}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/produtoparceiro/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "pageSize": 10,
          "id": id,
          "agenteParceiroId": agenteParceiroId,
          "trazerInformativoProdutos": true,
          "queryName": "JornadaDTO"
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoParceiro.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoParceiro>> filterForParceiro(
      {required int id, required int agenteParceiroId}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/produtoparceiro/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "pageSize": 10,
          "id": id,
          "agenteParceiroId": agenteParceiroId,
          "trazerInformativoProdutos": true,
          "queryName": "JornadaDTO"
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoParceiro.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<LoanException, CoResultDtoJornadaEtapa>>
      filterJornadaEtapaProposta({required int jornadaId,required int jornada}) async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appcommon/jornadaetapa/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "considerarEligibilidadeRestricoes": true,
          "trazerRestricaoConsiderandoJornada": true,
          "trazerExplicativoRestricoes": true,
          "trazerUltimasEtapaPorJornadaEAgenteParceiro": true,
          "page": 0,
          "jornada": jornada,
          "pageSize": 10,
          "jornadaId": jornadaId
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
 
  }

   Future<Either<LoanException, CoResultDtoJornadaEtapa>> gerarProposta(
      {required CoBaseListDto request}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appcommon/jornadaetapa/avancarEtapas',
          data: request.toMap());
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(LoanExceptionGeneric(message: e.toString()));
    }
  }
}
