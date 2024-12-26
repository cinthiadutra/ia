import 'dart:developer';

import 'package:bkopen/app/core/data/app_expcetions.dart';
import 'package:bkopen/app/core/data/co_result_dto_cliente.dart';
import 'package:bkopen/app/core/data/co_result_dto_couser.dart';
import 'package:bkopen/app/core/data/co_result_dto_culture.dart';
import 'package:bkopen/app/core/data/co_result_dto_hornada.dart';
import 'package:bkopen/app/core/data/co_result_dto_notification.dart';
import 'package:bkopen/app/services/config_app.dart';
import 'package:bkopen/onboarding/data/models/co_result_dto_onboarding.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../services/http_client/app_http.dart';
import '../../services/local_storage/local_storage.dart';

class AppRepository {
  final _clientAuth = AppHttp.withAuthentication().instance;
  final storage = Get.find<LocalStorage>();
  final kBaseUrl = ConfigApp.BASE_URL;

  ///filtra o CoUser do user logado
  Future<Either<AppException, CoResultDTOCoUser>> filterCoUser() async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfoundation/couser/filter',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "CoUserDTO",
            "items": {"pageSize": 100, "loggedUser": true}
          });

      var model = CoResultDTOCoUser.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(
          AppExceptionGeneric(message: 'Erro interno no couser/filter'));
    }
  }

  ///pega o status do onboarding
  Future<Either<AppException, OnboardingCoResultDTO>>
      getUpdateOnbording() async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfoundation/beonboarding/getupdatedbeonboard',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "BeOnBoardingDTO",
            "items": {}
          });

      var model = OnboardingCoResultDTO.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(AppExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<AppException, CoResultDtoPais>> getCountry() async {
    try {
      var resp = await _clientAuth
          .post('${kBaseUrl}appfoundation/coculture/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {"pageSize": 100},
        "queryName": "CoCultureDTO"
      });
      var model = CoResultDtoPais.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage = 'Erro inesperado. Tente novamente mais tarde.';
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData && responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(AppExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(
          AppExceptionGeneric(message: "Erro inesperado ao buscar pais."));
    }
  }

  ///envia o sms para o numero digitado
  Future<Either<AppException, CoResultoClient>> filterClient() async {
    try {
      var resp = await _clientAuth.post('${kBaseUrl}appcommon/cliente/filter',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "string",
            "items": {"logado": true}
          });
      var model = CoResultoClient.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(AppExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<AppException, CoResultDtoJornada>> filteerJornada() async {
    try {
      var resp =
          await _clientAuth.post('${kBaseUrl}appcommon/jornada/filter', data: {
        "classname": "CoQueryObjectDynamic",
        "items": {
          "page": 0,
          "agenteNegocioId": 3,
          "pageSize": 1,
          "trazerValorPretendido": true
        },
        "queryName": "JornadaDTO"
      });
      var model = CoResultDtoJornada.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(AppExceptionGeneric(message: e.toString()));
    }
  }

  Future<Either<AppException, CoResultDtoNotification>>
      getNotification() async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfoundation/conotification/getopennotifications',
          data: {
            "classname": "CoQueryObjectDynamic",
            "items": {"page": 0, "pageSize": 1, "getByLoggedUser": true},
            "queryName": "JornadaDTO"
          });
      var model = CoResultDtoNotification.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(AppExceptionGeneric(message: e.toString()));
    }
  }
}
