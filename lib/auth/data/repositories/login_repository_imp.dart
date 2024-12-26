// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:bkopen/app/services/config_app.dart';
import 'package:bkopen/app/services/http_client/app_http.dart';
import 'package:bkopen/auth/data/models/co_result_dto_password.dart';
import 'package:bkopen/auth/data/models/co_result_dto_user.dart';
import 'package:bkopen/auth/data/models/co_user_dto.dart';
import 'package:bkopen/auth/data/models/co_validation_dto.dart';
import 'package:bkopen/auth/data/models/login_expcetions.dart';
import 'package:bkopen/auth/data/models/login_model.dart';
import 'package:bkopen/auth/data/models/login_response.dart';
import 'package:bkopen/auth/data/models/register_model.dart';
import 'package:bkopen/auth/data/models/co_result_register.dart';
import 'package:bkopen/onboarding/data/models/co_result_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app/services/local_storage/local_storage.dart';
import '../models/register_expcetions.dart';

class LoginRepository {
  final _client = AppHttp().instance;
  final storage = Get.find<LocalStorage>();
  final kBaseUrl = ConfigApp.BASE_URL;

  Future<Either<LoginException, LoginResponse>> login(
      LoginModel request) async {
    try {
      var resp = await _client.post('${kBaseUrl}auth/login/', data: {
        "username": request.username,
        "password": request.password,
        "userdata": "linux"
      });
      var model = LoginResponse.fromMap(resp.data);

      return Right(model);
    } catch (e) {
      return Left(LoginExceptionGeneric(
          message:  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte."));
    }
  }

  Future<Either<RegisterExceptionGeneric, CoResultDTORegister>> register(
      RegisterModel request) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appfoundation/coregister/register',
          options: Options(headers: {'application': 'bc', 'locale': 'pt'}),
          data: {
            "classname": request.classname,
            "name": request.name,
            "email": request.email,
            "password": request.password,
          });
      var model = CoResultDTORegister.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage =  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.";
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(RegisterExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(RegisterExceptionGeneric(
          message:  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte."));
    }
  }

  Future<Either<RegisterExceptionGeneric, CoResultDTORegister>> validateCode(
      CoValidationDTO request) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appfoundation/coregister/validate',
          options: Options(headers: {'application': 'bmc', 'locale': 'pt'}),
          data: {
            "classname": 'CoValidationDTO',
            "entityId": request.entityId,
            "type": request.type,
            "validation": request.validation,
          });
      var model = CoResultDTORegister.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage =  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.";
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(RegisterExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(RegisterExceptionGeneric(
          message:  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte."));
    }
  }

  Future<Either<RegisterExceptionGeneric, CoResultDtoPassword>>
      generatePasswordResetCode(String email) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appfoundation/couser/generatepasswordresetcode',
          options: Options(headers: {'application': 'bmc', 'locale': 'pt'}),
          data: {
            "classname": 'CoUserDTO',
            "email": email,
          });
      var model = CoResultDtoPassword.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage =  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.";
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(RegisterExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(RegisterExceptionGeneric(
          message:  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte."));
    }
  }

  ///metodo que valida o codigo apos mudança de senha
  Future<Either<RegisterExceptionGeneric, CoResultDTO>>
      validatePasswordResetCode(CoValidationDTO request) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appfoundation/couser/validatepasswordresetcode',
          options: Options(headers: {'application': 'bmc', 'locale': 'pt'}),
          data: {
            "classname": request.classname,
            "entityId": request.entityId,
            "type": 4,
            "validation": request.validation,
          });
      var model = CoResultDTO.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage =  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.";
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(RegisterExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(RegisterExceptionGeneric(
          message:  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte."));
    }
  }

  ///metodo que valida o codigo apos mudança de senha
  Future<Either<RegisterExceptionGeneric, CoResultDtoUser>> changePassword(
      CoUserDtoRequest request) async {
    try {
      var resp = await _client.post(
          '${kBaseUrl}appfoundation/couser/changepassword',
          options: Options(headers: {'application': 'bmc', 'locale': 'pt'}),
          data: {
            "classname": "CoUserDTO",
            "id": request.id,
            "password": request.password,
          });
      var model = CoResultDtoUser.fromMap(resp.data);

      return Right(model);
    } on DioException catch (dioError) {
      log("DioError: ${dioError.message}");

      // Obter mensagem de erro da resposta, se disponível
      String errorMessage =  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.";
      if (dioError.response != null) {
        final responseData = dioError.response?.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('detail')) {
          errorMessage = responseData['detail'] as String;
        } else {
          errorMessage = dioError.response?.statusMessage ?? errorMessage;
        }
      }

      return Left(RegisterExceptionGeneric(message: errorMessage));
    } catch (e) {
      log("Erro inesperado: $e");
      return Left(RegisterExceptionGeneric(
          message:  "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte."));
    }
  }
}
