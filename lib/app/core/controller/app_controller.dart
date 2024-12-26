import 'dart:async';
import 'dart:developer';

import 'package:bkopen/app/core/data/app_repository.dart';
import 'package:bkopen/app/core/data/co_result_dto_cliente.dart';
import 'package:bkopen/app/core/data/co_result_dto_notification.dart';
import 'package:bkopen/app/core/data/co_user_dto.dart';
import 'package:bkopen/app/core/data/ex_co_notification_dto.dart';
import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/app/utils/loader_mixin.dart';
import 'package:bkopen/onboarding/data/models/onboardingDTO.dart';
import 'package:bkopen/profile/data/models/co_culture_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppController extends GetxController with LoaderMixin {
  final loadingMessage = ''.obs;

  final int maxReconnectAttempts = 5; // Limite de tentativas
  void _handleError(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 4),
    );
  }

  final storage = Get.find<LocalStorage>();

  RxList<String> receivedMessages = <String>[].obs;

  final Rx<int> iduser = Rx(0);
  final Rx<int> idCOuser = Rx(0);
  int? clientId;

  Rx<String> usernameUser = Rx('');
  RxList<CoCultureDto> listCountry = <CoCultureDto>[].obs;
  ClienteDto? client;

  Rx<String> emailUser = Rx('');
  Rx<String> cellphoneUser = Rx('');
  final repository = Get.find<AppRepository>();
  final ws = Get.find<WebSocketService>();

  final Rx<CoUserDto> couser = Rx(CoUserDto());
  RxBool isLoading = true.obs;
  final Rx<BeOnBoardingDTO> onboarding = Rx(BeOnBoardingDTO());

  final Rx<ExCoNotificationDto> message = Rx(ExCoNotificationDto());
  final Rx<CoResultDtoNotification> messageAlls = Rx(CoResultDtoNotification());
  final Rx<List<ExCoNotificationDto>> messageAll = Rx([]);

  Future<void> getCoUserLogged() async {
    isLoading == true.obs;

    final response = await repository.filterCoUser();
    response.fold((erro) {
      isLoading.value == false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value == false;
      if (sucess.withError == true) {
        _handleError("Erro",
            "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
      } else {
        couser.value = sucess.data!.first;
        idCOuser.value = sucess.data!.first.id!;
        usernameUser.value = sucess.data!.first.username!;
        emailUser.value = sucess.data!.first.email!;

        cellphoneUser.value = sucess.data!.first.cellPhone ?? '';
      }
      getPais();
    });
  }

  /// atualiza a etapa que estiver no onbording trazendo os dados do objeto OnboardingDTO
  Future<void> getUpdateOnboarding() async {
    isLoading == true.obs;

    final response = await repository.getUpdateOnbording();
    response.fold((erro) {
      isLoading.value == false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value == false;
      if (sucess.withError == true) {
        _handleError("Erro",
            "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
      } else {
        onboarding.value = sucess.data!;
        iduser.value = sucess.data!.id!;
        idCOuser.value = sucess.data?.coUserId ?? 0;
        if (onboarding.value.authCellPhone == null) {
          Get.toNamed(PageRoutes.onboardingpage);
        } else if (onboarding.value.termsOfUse == null) {
          Get.toNamed(PageRoutes.onboardingterms);
        } else if (onboarding.value.termsOfUse == '' ||
            onboarding.value.termsOfUse == null) {
          Get.toNamed(PageRoutes.terms);
        } else if (onboarding.value.legalDocument == null) {
          Get.toNamed(PageRoutes.onboardingpagedoc);
        } else if (onboarding.value.video == '' ||
            onboarding.value.video == null) {
          Get.toNamed(PageRoutes.onboardingpagemidia);
        } else {
          filterClient(id: sucess.data!.id!);
          Get.toNamed(PageRoutes.homepage);
        }
      }
    });
  }

  Future<void> getPais() async {
    isLoading.toggle();

    final response = await repository.getCountry();
    response.fold((error) {
      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.'Erro ao alterar seus dados, por favor tente novamente ");

      isLoading.toggle();
    }, (sucess) {
      isLoading.toggle();

      if (sucess.withError == true) {
        _handleError("Erro",
            "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.'Erro ao alterar seus dados, por favor tente novamente ");
      } else {
        listCountry.value = sucess.data!;
      }
    });
  }

  Future<void> filterClient({required int id}) async {
    isLoading.value == true;

    final response = await repository.filterClient();

    response.fold((e) {
      isLoading.value == false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value == false;
      if (sucess.withError == true) {
        _handleError("Erro", 'Celular já está cadastrado. Utilize outro');
      } else {
        client = sucess.data!.first;
        clientId = sucess.data?.first.id;
        log("Client ID: $clientId");
      }
    });
  }

  String formatCurrency(String value) {
    // Converte a String para double, caso não seja um valor numérico, retorna "0.00"
    double amount = double.tryParse(value) ?? 0.00;

    // Formata o valor para o padrão brasileiro de moeda
    final formatCurrency =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatCurrency.format(amount);
  }

  Future<void> getNotification() async {
    isLoading == true.obs;

    final response = await repository.getNotification();
    response.fold((erro) {
      isLoading.value == false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value == false;
      if (sucess.withError == true) {
        _handleError("Erro",
            "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
      } else {
        messageAlls.value = sucess;
        messageAll.value = messageAlls.value.data ?? [];
      }
    });
  }
}
