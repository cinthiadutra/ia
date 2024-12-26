import 'dart:async';
import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/app/utils/loader_mixin.dart';
import 'package:bkopen/auth/data/models/co_register_dto.dart';
import 'package:bkopen/auth/data/models/co_user_dto.dart';
import 'package:bkopen/auth/data/models/co_validation_dto.dart';
import 'package:bkopen/auth/data/models/login_model.dart';
import 'package:bkopen/auth/data/models/register_model.dart';
import 'package:bkopen/auth/data/repositories/login_repository_imp.dart';
import 'package:bkopen/loan/components/terms_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/co_result_dto_password.dart';
import '../data/models/co_result_dto_user.dart';

class LoginController extends GetxController with LoaderMixin {
  RxBool isLoading = false.obs;
  RxBool obscureText = true.obs;
  RxBool isAcceptPolicy = false.obs;
  RxBool isAcceptTerms = false.obs;

  String recoveryPassword = "recovery";

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController passwordCreate = TextEditingController();
  TextEditingController passwordRepeat = TextEditingController();
  TextEditingController codeAuthentic = TextEditingController();

  final appController = Get.find<AppController>();
  final ws = Get.find<WebSocketService>();

  final repository = Get.find<LoginRepository>();
  final storage = Get.find<LocalStorage>();

  RxString token = "".obs;
  Rx<CoRegisterDto> register = Rx(CoRegisterDto());
  Rx<CoResultDtoResetData> couser = Rx(CoResultDtoResetData());
  Rx<CoResultDtoUser> couserFinal = Rx(CoResultDtoUser());

  Rx<bool> isButtonVisible = Rx(false);
  Rx<int> resendCountdown = Rx(10);
  Rx<int> id = Rx(0);
  final loadingMessage = ''.obs;

  late Timer _timer;

  var hasUpperCase = false.obs;
  var hasSpecialCharacter = false.obs;
  var hasNumbers = false.obs;
  var hasMinLength = false.obs;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
    loaderListener(isLoading, loadingMessage);
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancela o timer ao fechar o controller
    super.onClose();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCountdown.value > 0) {
        resendCountdown.value--;
      } else {
        isButtonVisible.value = true;
        _timer.cancel();
      }
    });
  }

  void resetCountdown() {
    resendCountdown.value = 10;
    isButtonVisible.value = false;
    startCountdown();
  }

  void toggleCheckboxPolicy(BuildContext context) {
    isAcceptPolicy.value = !isAcceptPolicy.value;
    if (isAcceptPolicy.value) {
      _showDialog(context, 'https://bkopen.com/privacy-policy',
          'Política de Privacidade');
    }
  }

  void toggleCheckboxTerms(BuildContext context) {
    isAcceptTerms.value = !isAcceptTerms.value;
    if (isAcceptTerms.value) {
      _showDialog(context, 'https://bkopen.com/terms-of-use', 'Termos de Uso');
    }
  }

  void _showDialog(BuildContext context, String url, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TermsDialog(url: url, title: title);
      },
    );
  }

  void validatePassword(String password) {
    hasUpperCase.value = password.contains(RegExp(r'[A-Z]'));
    hasSpecialCharacter.value =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasNumbers.value = password.contains(RegExp(r'[0-9]'));
    hasMinLength.value = password.length >= 6;
  }

  ///metodo de logar
  Future<void> signIn() async {
    isLoading.value = true;

    final response = await repository.login(LoginModel(
        username: username.text.toLowerCase(), password: password.text));

    response.fold((error) {
      isLoading.value = false;

      _handleError("Erro de Login",
          "E-mail ou senha incorretos. Verifique suas credenciais e tente novamente.");
    }, (success) async {
      await _storeTokenAndNavigate(success.token);
      isLoading.value = false;
    });
  }

  /// metodo de criar conta
  Future<void> signUp() async {
    isLoading.value = true;
    final response = await repository.register(RegisterModel(
        email: email.text, name: name.text, password: passwordCreate.text));

    response.fold((error) {
      isLoading.value = false;

      _handleError("Erro ao Registrar", "E-mail já está cadastrado.");
    }, (success) {
      isLoading.value = false;

      if (success.withError == true) {
        _handleError("Erro ao Cadastrar",
            success.comessageList?.first.astMessage ?? 'Erro');
      } else {
        _handleSuccessfulSignUp(success);
      }
    });
  }

  ///enviar sms para numero
  Future<void> sendCode() async {
    isLoading.value = true;

    final response = await repository.register(RegisterModel(
        email: email.text, name: name.text, password: passwordCreate.text));

    response.fold((error) {
      isLoading.value = false;
      _handleError("Erro",
          "Código incorreto. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
    }, (success) {
      isLoading.value = false;

      if (success.withError == true) {
        _handleError("Erro ao Enviar",
            success.comessageList?.first.astMessage ?? 'Erro');
      } else {
        _handleCodeSent(success);
      }
    });
  }

  ///valida o codigo inserido
  Future<void> validateCode() async {
    isLoading.value = true;

    final response = await repository.validateCode(CoValidationDTO(
        entityId: register.value.id.toString(),
        type: 0,
        validation: codeAuthentic.text));

    response.fold((error) {
      isLoading.value = false;

      _handleError("Erro de Validação",
          "Código incorreto. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
    }, (success) {
      isLoading.value = false;

      if (success.withError == true) {
        _handleError("Erro ao Validar",
            "Código incorreto ou expirado. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
      } else if (success.withError == false &&
          success.comessageList!.isNotEmpty) {
        _handleError("Erro ao Validar",
            "Código incorreto ou expirado. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
      } else {
        _navigateAfterValidation();
      }
    });
  }

  ///gera novo codigo para autenticar na mudança de senha
  Future<void> generatePasswordCode() async {
    isLoading.value = true;

    final response = await repository.generatePasswordResetCode(email.text);

    response.fold((error) {
      isLoading.value = false;

      _handleError("Erro de Validação",
          "Código incorreto. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
    }, (success) {
      if (success.withError == true) {
        _handleError("Erro ao Validar",
            success.comessageList?.first.astMessage ?? 'Erro');
      } else {
        _handleSuccessfulGeneratePassword(success);
      }
    });
  }

  /// valida o codigo na mudança de senha
  Future<void> validatePasswordResetCode() async {
    isLoading.value = true;

    final response = await repository.validatePasswordResetCode(CoValidationDTO(
        classname: "CoValidationDTO",
        entityId: id.toString(),
        type: 4,
        validation: codeAuthentic.text));

    response.fold((error) {
      isLoading.value = false;

      _handleError("Erro de Validação",
          "Código incorreto. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
    }, (success) {
      isLoading.value = false;

      if (success.withError == true) {
        _handleError("Erro ao Validar",
            "Código incorreto ou expirado. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
      } else if (success.withError == false &&
          success.comessageList!.isNotEmpty) {
        _handleError("Erro ao Validar",
            "Código incorreto ou expirado. Verifique o código enviado e tente novamente. ou repita o processo para obter um novo código");
      } else {
        codeAuthentic.clear();
        Get.offAndToNamed(PageRoutes.recoverypasswordpage);
      }
    });
  }

  ///metodo que troca a senha

  Future<void> changePassword() async {
    isLoading.value = true;

    final response = await repository.changePassword(CoUserDtoRequest(
        classname: "CoUserDTO",
        id: id.value.toString(),
        password: passwordCreate.text));

    response.fold((error) {
      isLoading.value = false;

      _handleError("Erro de Validação",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (success) {
      isLoading.value = false;

      if (success.withError == true) {
        _handleError(
            "Erro ao Validar",
            success.comessageList?.first.astMessage ??
                "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
      } else {
        _handleChangePassword(success);
      }
    });
  }

  Future<void> _storeTokenAndNavigate(String tokenValue) async {
    await storage.put('token', tokenValue);
    token.value = tokenValue;
    appController.getPais();
    appController.getUpdateOnboarding();
    appController.getCoUserLogged();
    ws.initConnection();
  }

  void _handleSuccessfulSignUp(success) {
    register.value = success.data!;
    email.clear();
    name.clear();
    passwordCreate.clear();
    passwordRepeat.clear();
    Get.offAndToNamed(PageRoutes.authenticationPage, arguments: "register");
  }

  void _handleSuccessfulGeneratePassword(success) {
    couser.value = success.data!.data!;
    id.value = success.data!.data!.id!;
    recoveryPassword = "recovery";
    email.clear();

    Get.offAndToNamed(PageRoutes.authenticationPage,
        arguments: recoveryPassword);
  }

  void _handleCodeSent(success) {
    register.value = success.data!;
    email.clear();
    name.clear();
    password.clear();
  }

  void _handleChangePassword(success) {
    couserFinal.value = success;
    passwordCreate.clear();
    passwordRepeat.clear();

    Get.offAndToNamed(PageRoutes.recoverypasswordsucess);
  }

  void _navigateAfterValidation() {
    codeAuthentic.clear();
    if (recoveryPassword == "recovery") {
      Get.offAndToNamed(PageRoutes.recoverypasswordpage);
    } else {
      Get.offAndToNamed(PageRoutes.registersucess);
    }
  }

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

  String? validateSecurePassword(String? password) {
    if (password == null || password.isEmpty) {
      return Strings.validationPasswordEmpty; // Mensagem para senha vazia
    }

    // Verificações
    bool hasMinLength = password.length >= 6;
    bool hasSpecialCharacter =
        RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
    bool hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
    bool hasNumbers = RegExp(r'[0-9]').hasMatch(password);

    // Mensagem de erro se não atender aos requisitos
    if (!hasMinLength) {
      return "A senha deve conter ao menos 6 caracteres.";
    }
    if (!hasSpecialCharacter) {
      return "A senha deve conter caracteres especiais.";
    }
    if (!hasUpperCase) {
      return "A senha deve conter letras maiúsculas.";
    }
    if (!hasNumbers) {
      return "A senha deve conter números.";
    }

    // Se tudo estiver ok, retorne null
    return null;
  }
}
