import 'dart:developer';
import 'dart:io';

import 'package:bkopen/app/services/http_client/app_http.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/home/data/models/co_result_dto_exhomedto.dart';
import 'package:bkopen/home/data/models/co_result_dto_filter.dart';
import 'package:bkopen/home/data/models/home_expcetions.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_parceiro.dart';
import 'package:bkopen/loan/data/models/co_base_list_dto.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_atribute.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_etapa.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/services/config_app.dart';

class HomeRepository {
  final _client = AppHttp.withAuthentication().instance;
  final storage = Get.find<LocalStorage>();
  final kBaseUrl = ConfigApp.BASE_URL;

  
  Future<Either<HomeException, CoResultDtoHomeload>> loadHome() async {
    try {
      var resp =
          await _client.post('${kBaseUrl}appcommon/jornada/loadHome', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {"page": 0, "agenteNegocioId": 3},
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoHomeload.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<HomeException, CoResultDtoHome>> filterJornada( ) async {
    try {
      var resp =
          await _client.post('${kBaseUrl}appcommon/jornada/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {"page": 0, "agenteNegocioId": 3, "pageSize":1, "trazerValorPretendido":true, "clienteLogado":true },
        "queryName": "JornadaDTO"
        
      });
      var model = CoResultDtoHome.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
  }
  

  Future<Either<HomeException, CoResultDtoJornadaAtribute>> simulacaoDetail(
      {required JornadaEtapaDto request}) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appcommon/jornadaetapa/memoriacalculo',
          data: request.toMap());
      var model = CoResultDtoJornadaAtribute.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
  }


  Future<Either<HomeException, CoResultDtoJornadaEtapa>> filterJornadaEtapa(
      {required int jornadaId, required int jornada}) async {
    try {
      var resp = await _client
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
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<HomeException, CoResultDtoJornadaEtapa>> gerarProposta(
      {required CoBaseListDto request}) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appcommon/jornadaetapa/avancarEtapas',
          data: request.toMap());
      var model = CoResultDtoJornadaEtapa.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
  }
  Future<Either<HomeException, CoResultDtoJornadaEtapa>>
      filterJornadaEtapaProposta({required int jornadaId,required int jornada}) async {
    try {
      var resp = await _client
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
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
 
  }
  Future<Either<HomeException, File>> baixarResumoJornada({
  required int jornadaId,
}) async {
  try {
    // Faz a requisição HTTP
    final resp = await _client.post(
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
      return Left(HomeExceptionGeneric(message: "Não foi possível acessar a pasta Downloads."));
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
    return Left(HomeExceptionGeneric(message: e.toString()));
  }
}

  Future<Either<HomeException, CoResultDtoParceiro>> filterParceiro(
      {required int id, required int agenteParceiroId}) async {
    try {
      var resp = await _client
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
      return Left(HomeExceptionGeneric(message: e.toString()));
    }
  }

}
