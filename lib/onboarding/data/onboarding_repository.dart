import 'dart:developer';

import 'package:bkopen/app/core/data/co_result_dto_couser.dart';
import 'package:bkopen/onboarding/data/models/co_result_dto_onboarding.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app/services/local_storage/local_storage.dart';
import '../../app/services/config_app.dart';
import '../../app/services/http_client/app_http.dart';
import 'models/onboarding_expcetions.dart';

class OnboardingRepository {
  final _clientAuth = AppHttp.withAuthentication().instance;
  final storage = Get.find<LocalStorage>();
  final kBaseUrl = ConfigApp.BASE_URL;

  ///envia o sms para o numero digitado
  Future<Either<OnboardingException, OnboardingCoResultDTO>> sendSms(
      {required int id, required String cellphone}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfrontier/beonboardingbkopen/advancebeonboardingstepbcc',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "BeOnBoardingDTO",
            "items": {
              "id": id,
              "cellphone": cellphone,
              "step": "authCellPhone",
              "skipStep": false
            }
          });
      var model = OnboardingCoResultDTO.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(OnboardingExceptionGeneric(message: e.toString()));
    }
  }

  ///valida o sms
  Future<Either<OnboardingException, OnboardingCoResultDTO>> validateCod({
    required int id,
    required String code,
  }) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfrontier/beonboardingbkopen/advancebeonboardingstepbcc',
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "BeOnBoardingDTO",
            "items": {
              "id": id,
              "subProcess": 1,
              "code": code,
              "step": "authCellPhone",
              "skipStep": false
            }
          });
      var model = OnboardingCoResultDTO.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(OnboardingExceptionGeneric(message: e.toString()));
    }
  }

  ///aceita o termo de uso
  Future<Either<OnboardingException, OnboardingCoResultDTO>>
      acceptedTermsOfUser({
    required int id,
  }) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfrontier/beonboardingbkopen/advancebeonboardingstepbcc',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "BeOnBoardingDTO",
            "items": {
              "id": id,
              "accepted": true,
              "step": "termsOfUse",
              "skipStep": false
            }
          });

      var model = OnboardingCoResultDTO.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(OnboardingExceptionGeneric(message: e.toString()));
    }
  }

  ///aceita o ter
  Future<Either<OnboardingException, OnboardingCoResultDTO>> sendDocument(
      {required int id, required String document}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfrontier/beonboardingbkopen/advancebeonboardingstepbcc',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "BeOnBoardingDTO",
            "items": {
              "id": id,
              "document": document,
              "step": "legalDocument",
              "skipStep": false
            }
          });

      var model = OnboardingCoResultDTO.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(OnboardingExceptionGeneric(message: e.toString()));
    }
  }

  ///nao ver mais o video e finalizar o chat
  Future<Either<OnboardingException, OnboardingCoResultDTO>> videoShow(
      {required int id, required bool doNotShowAgain}) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfrontier/beonboardingbkopen/advancebeonboardingstepbcc',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "classname": "CoQueryObjectDynamic",
            "queryName": "BeOnBoardingDTO",
            "items": {
              "id": id,
              "doNotShowAgain": doNotShowAgain,
              "step": "video",
              "skipStep": false
            }
          });

      var model = OnboardingCoResultDTO.fromMap(resp.data);
      log(model.toString());

      return Right(model);
    } catch (e) {
      log(e.toString());
      return Left(OnboardingExceptionGeneric(message: e.toString()));
    }
  }

  ///filtra o CoUser do user logado
  Future<Either<OnboardingException, CoResultDTOCoUser>> filterCoUser() async {
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
      return Left(OnboardingExceptionGeneric(message: e.toString()));
    }
  }
}
