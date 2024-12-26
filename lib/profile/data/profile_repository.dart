import 'dart:developer';

import 'package:bkopen/app/services/config_app.dart';
import 'package:bkopen/auth/data/models/co_result_dto_user.dart';
import 'package:bkopen/auth/data/models/co_user_dto.dart';
import 'package:bkopen/profile/data/profile_expcetions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../app/services/http_client/app_http.dart';
import '../../app/services/local_storage/local_storage.dart';

class ProfileRepository {
  final _clientAuth = AppHttp.withAuthentication().instance;
  final storage = Get.find<LocalStorage>();
  final kBaseUrl = ConfigApp.BASE_URL;

  Future<Either<ProfileException, CoResultDtoUser>> changePassword(
      CoUserDtoRequest request, String oldPassword) async {
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfoundation/couser/changePasswordInternal',
          options: Options(headers: {'application': 'bmc', 'locale': 'pt'}),
          data: {
            "classname": "CoUserDTO",
            "id": request.id,
            "oldPassword": oldPassword,
            "password": request.password,
          });
      var model = CoResultDtoUser.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage = 'Erro inesperado. Tente novamente mais tarde.';
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(ProfileExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(ProfileExceptionGeneric(
          message: "Erro inesperado ao alterar a senha."));
    }
  }



  Future<Either<ProfileException, CoResultDtoUser>> changeRegisterUser(
      CoUserDTO request) async {
    var hora = DateTime.now().toUtc().toIso8601String();
    try {
      var resp = await _clientAuth.post(
          '${kBaseUrl}appfoundation/couser/update',
          options: Options(headers: {'application': 'bcc', 'locale': 'pt'}),
          data: {
            "id": request.id,
            "classname": "CoUserDTO",
            "name": request.name,
            "lastName": request.lastName,
            "legalDocument": request.legalDocument,
            "birth": request.birth,
            "type": 0,
            "coCultureId": 1,
            "username": request.username,
            "updated": hora,
            "cellPhone":request.cellPhone,
            "email":request.email
          });
      var model = CoResultDtoUser.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage = 'Erro inesperado. Tente novamente mais tarde.';
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(ProfileExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(ProfileExceptionGeneric(
          message: "Erro inesperado ao alterar a senha."));
    }
  }
}
