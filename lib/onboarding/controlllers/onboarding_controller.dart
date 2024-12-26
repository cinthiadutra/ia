import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/onboarding/data/models/co_template_dto.dart';
import 'package:bkopen/app/core/data/co_user_dto.dart';
import 'package:bkopen/onboarding/data/onboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/utils/loader_mixin.dart';
import '../data/models/onboardingDTO.dart';

class OnboardingController extends GetxController with LoaderMixin {
  /// variaveis utilizadas
  final int pageCount = 5;
  final Rx<int> currentPage = Rx(0);
  final Rx<String> ddiSelected = Rx('');
  final Rx<String> flag = Rx('');
  final Rx<String> numeroCelular = Rx('');

  final Rx<bool> isCadastredPhone = Rx(false);
  final Rx<bool> isSendAgainSms = Rx(false);

  final Rx<bool> enable = Rx(true);

  final Rx<bool> isconnect = Rx(false);
  final Rx<bool> doNotShowAgain = Rx(false);

  final Rx<int> iduser = Rx(0);
  final Rx<int> idCOuser = Rx(0);

  final Rx<int> idCoClient = Rx(0);
  Rx<String> videoId = Rx('');
  Rx<String> usernameUser = Rx('');
  Rx<String> emailUser = Rx('');
  Rx<String> cellphoneUser = Rx('');

  final Rx<String> countrySelecioned = Rx('');
  final Rx<BeOnBoardingDTO> onboarding = Rx(BeOnBoardingDTO());
  final Rx<CoTemplateDto> listAtribute = Rx(CoTemplateDto());
  final Rx<CoUserDto> couser = Rx(CoUserDto());
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

  final Rx<String> listVideos =
      Rx('https://bkopen.com/media/onboardingmob.mp4');
  late Rx<String>? tokenSaved = Rx('');
  Rx<int> viewcoProducerSMindId = Rx(0);

  final Rx<List<String>> selectedItems = Rx([]);
  RxBool isLoading = true.obs;

  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController doc = TextEditingController();

  /// gestao de dependencia
  final repository = Get.find<OnboardingRepository>();
  final appController = Get.find<AppController>();

  final storage = Get.find<LocalStorage>();

  @override
  void onInit() {
    super.onInit();
    appController.iduser.value = appController.iduser.value;
  }

  /// logica para mudar butao automaticamente
  void togleButton() {
    isconnect.value == true;
  }

  final RxBool isSelected = false.obs;

  /// faz a selecao de personalidades
  void toggleSelected(String person) {
    if (selectedItems.value.contains(person)) {
      selectedItems.value.remove(person);
    } else {
      selectedItems.value.add(person);
    }
    update();
  }

  // ///carrega o json de paises
  // void carregarPaises() async {
  //   final String response =
  //       await rootBundle.loadString('assets/pais_model.json');
  //   final data = await json.decode(response);
  //   listCountry.value =
  //       (data as List).map((i) => CountryModel.fromMap(i)).toList();
  // }

  ///envia o sms para validacao do celular
  Future<void> sendSms() async {
    isLoading.value = true;
    var numberInternacional =
        "${appController.listCountry.first.telPrefix??'+55'}${phone.text}";
    var numeroformatado = numberInternacional.replaceAll("(", '');
    numeroformatado = numeroformatado.replaceAll(")", '');
    numeroformatado = numeroformatado.replaceAll(" ", '');
    numeroformatado = numeroformatado.replaceAll("-", '');
    final response = await repository.sendSms(
        id: appController.iduser.value, cellphone: numeroformatado);

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value = false;
      if (sucess.withError == true) {
        _handleError("Erro", 'Celular já está cadastrado. Utilize outro');
      } else {
        if (isSendAgainSms.value) {
          Get.snackbar(
              "Mensagem Enviada",
              sucess.comessageList?.first.astMessage ??
                  'Mensagem Enviada com Sucesso',
              duration: const Duration(seconds: 5),
              snackStyle: SnackStyle.FLOATING,
              backgroundColor: BKOpenColors.statusGreen,
              colorText: BKOpenColors.white);
        } else {
          Get.toNamed(PageRoutes.onboardingpageconfirm);
        }
      }
    });
  }

  /// valida o código de sms que foi enviado para validar o cellphone
  Future<void> validateCode() async {
    isLoading.value = false;
    final response = await repository.validateCod(
      id: appController.iduser.value,
      code: code.text,
    );
    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value == false;
      if (sucess.withError == true) {
        _handleError("Erro",
            "Código incorreto. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
      } else if (sucess.withError == false &&
          sucess.comessageList!.isNotEmpty) {
        _handleError("Erro",
            "Código incorreto. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
      } else {
        isCadastredPhone.value = true;

        Get.offAndToNamed(PageRoutes.onboardingterms);
      }
    });
  }

  /// aceita os termos de uso
  Future<void> acceptedTermsOfUser() async {
    isLoading.value == false;

    final response =
        await repository.acceptedTermsOfUser(id: appController.iduser.value);

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value = false;

      if (sucess.withError == true) {
        _handleError("Erro",
            "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
      } else {
        Get.toNamed(PageRoutes.onboardingpagedoc);
      }
    });
  }

  Future<void> sendDocument() async {
    final response = await repository.sendDocument(
        id: appController.iduser.value,
        document: doc.text.replaceAll('.', '').replaceAll('-', ''));

    response.fold((e) {
      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value = false;
      if (sucess.withError == true) {
        _handleError("Erro",
            "CPF já cadastrado, tente novamente ou logue na conta associada");
      } else {
        Get.toNamed(PageRoutes.onboardingpagemidia);
      }
    });
  }

  Future<void> finishedOnboarding() async {
    isLoading.value = true;

    final response = await repository.videoShow(
        id: appController.iduser.value, doNotShowAgain: doNotShowAgain.value);

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value = false;

      if (sucess.withError == true) {
        _handleError("Erro",
            "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
      } else {
        Get.offAndToNamed(PageRoutes.homepage);
      }
    });
  }
}
