import 'dart:async';
import 'dart:io';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/auth/data/models/co_result_dto_user.dart';
import 'package:bkopen/profile/data/models/co_culture_dto.dart';
import 'package:bkopen/profile/data/profile_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/data/models/co_user_dto.dart';

class ProfileController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<bool> isSelectedList = List.generate(8, (_) => false).obs;
  final Rx<bool> isHome = Rx(true);
  final repository = Get.find<ProfileRepository>();
  TextEditingController codeAuthentic = TextEditingController();
  TextEditingController personality = TextEditingController();
  TextEditingController countrySelected = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController personalidadeController = TextEditingController();
  TextEditingController docController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  var hasUpperCase = false.obs;
  var hasSpecialCharacter = false.obs;
  var hasNumbers = false.obs;
  var hasMinLength = false.obs;

  final Rx<String> littleName = Rx('');
  final Rx<String> username = Rx('');
  final Rx<int> selectPais = Rx(1);

  final Rx<dynamic> personalitySelected = Rx(null);

  final Rx<List<String>> listPersonality =
      Rx(['Pessoa Física', 'Pessoa Juridica']);

  final Rx<List<CoCultureDto>> listCountry = Rx([]);

  TextEditingController passwordOld = TextEditingController();
  TextEditingController passwordCreate = TextEditingController();
  TextEditingController passwordRepeat = TextEditingController();
  final Rx<CoUserDTO> couser = Rx(CoUserDTO());

  final appController = Get.find<AppController>();
  var imagePath = ''.obs;
  var isImageSavedPerfil = false.obs;
  @override
  void onInit() {
    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    super.onInit();
    // Inicializando controladores com dados do usuário
    nameController.text = appController.couser.value.name ?? '';
    lastnameController.text = appController.couser.value.lastName ?? '';
    docController.text = appController.couser.value.legalDocument ?? '';
    birthController.text = appController.couser.value.birth ?? '';
    namedProfile();
    appController.getCoUserLogged();
  }

  void toggleSelected(int index) {
    for (int i = 0; i < isSelectedList.length; i++) {
      if (i == index) {
        isSelectedList[i] = !isSelectedList[i];
      } else {
        isSelectedList[i] = false;
      }
    }
  }

  List<BannerModel> getListBannersData() {
    int i = 0;
    List<BannerModel> listBanners = [];

    List<String> listLinkBanners = [
      "https://firebasestorage.googleapis.com/v0/b/myfirstapp-9910a.appspot.com/o/photo_url%2FUBVJlYIlUjT8EVKTBa0SGbKjYhB2photoUrl?alt=media&token=8be150ed-0d14-4ee4-946d-e99b02d52164",
      "https://firebasestorage.googleapis.com/v0/b/myfirstapp-9910a.appspot.com/o/photo_url%2FUBVJlYIlUjT8EVKTBa0SGbKjYhB2photoUrl?alt=media&token=8be150ed-0d14-4ee4-946d-e99b02d52164",
      "https://firebasestorage.googleapis.com/v0/b/myfirstapp-9910a.appspot.com/o/photo_url%2FUBVJlYIlUjT8EVKTBa0SGbKjYhB2photoUrl?alt=media&token=8be150ed-0d14-4ee4-946d-e99b02d52164",
      "https://firebasestorage.googleapis.com/v0/b/myfirstapp-9910a.appspot.com/o/photo_url%2FUBVJlYIlUjT8EVKTBa0SGbKjYhB2photoUrl?alt=media&token=8be150ed-0d14-4ee4-946d-e99b02d52164",
      "https://firebasestorage.googleapis.com/v0/b/myfirstapp-9910a.appspot.com/o/photo_url%2FUBVJlYIlUjT8EVKTBa0SGbKjYhB2photoUrl?alt=media&token=8be150ed-0d14-4ee4-946d-e99b02d52164"
    ];
    for (var link in listLinkBanners) {
      i++;
      BannerModel bannerModel = BannerModel(imagePath: link, id: i.toString());
      listBanners.add(bannerModel);
    }

    return listBanners;
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      await saveFile(file);
    }
  }

  namedProfile() {
    List<String> palavras = couser.value.name?.split(" ") ?? [];
    littleName.value =
        palavras.map((palavra) => palavra[0]).join().toUpperCase();
  }

  String getIniciais(String? nome) {
    if (nome == null || nome.isEmpty) {
      return ""; // Retorna vazio se o nome for nulo ou vazio
    }

    List<String> palavras = nome.trim().split(" ");

    // Pega a primeira letra do primeiro nome
    String primeiraLetra = palavras[0][0].toUpperCase();

    // Pega a primeira letra do segundo nome, se existir
    String segundaLetra =
        palavras.length > 1 ? palavras[1][0].toUpperCase() : "";

    return primeiraLetra + segundaLetra;
  }

  Future<void> saveFile(File file) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final File newFile =
          await file.copy('$appDocPath/${file.path.split('/').last}');
      imagePath.value = newFile.path;
      isImageSavedPerfil.value = true;
      saveImageToPreferences(newFile.path);
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao salvar o arquivo: $e');
    }
  }

  void saveImageToPreferences(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imagePath', path);
  }

  void loadImageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? path = prefs.getString('imagePath');
    if (path != null) {
      imagePath.value = path;
      isImageSavedPerfil.value = true;
    }
  }

  Future<void> changePasswordInternal() async {
    isLoading.value = true;

    final response = await repository.changePassword(
        CoUserDtoRequest(
            classname: "CoUserDTO",
            id: appController.couser.value.id.toString(),
            password: passwordCreate.text),
        passwordOld.text);

    response.fold((error) {
      isLoading.value = false;

      _handleError(
          "Erro", 'Erro ao alterar sua senha, por favor tente novamente ');
    }, (sucess) {
      isLoading.value = false;

      if (sucess.withError == true) {
        _handleError("Erro", "Senha atual incorreta. Tente novamente.");
      } else {
        couser.value = sucess.data!;
        passwordCreate.clear();
        passwordRepeat.clear();

        Get.offAllNamed(
          PageRoutes.loginpage,
        );
        Get.snackbar('Sua senha foi alterada com sucesso!',
            'Sua senha foi alterada com sucesso!',
            duration: const Duration(seconds: 5),
            snackStyle: SnackStyle.FLOATING,
            backgroundColor: BKOpenColors.statusGreen,
            colorText: BKOpenColors.white);
      }
    });
  }

  void up() async {
    appController.getCoUserLogged();
    uploadProfile();
  }

  Future<void> uploadProfile() async {
    isLoading.value = true;
    appController.getCoUserLogged();

    // Inicializa a variável para a data formatada
    String? formattedBirth;

    // Verifica se o campo de data não está vazio
    if (birthController.text.isNotEmpty) {
      try {
        // Remove qualquer caractere não numérico da string (dd/MM/yyyy -> 25111990)
        String cleanedDate =
            birthController.text.replaceAll(RegExp(r'[^\d]'), '');

        // Verifica se a string contém 8 caracteres (ddMMyyyy)
        if (cleanedDate.length == 8) {
          // Extrai dia, mês e ano da string (ddMMyyyy)
          String day = cleanedDate.substring(0, 2);
          String month = cleanedDate.substring(2, 4);
          String year = cleanedDate.substring(4, 8);

          // Converte para o formato yyyy-MM-dd
          formattedBirth = "$year-$month-$day";
        } else {
          throw FormatException('Formato de data inválido');
        }
      } catch (e) {
        isLoading.value = false;
        _handleError("Erro", "Data de nascimento inválida: $e");
        return;
      }
    }

    // Cria um novo CoUserDTO com os dados atualizados
    CoUserDTO updatedUser = CoUserDTO(
        id: couser.value.id == 0 || couser.value.id == null
            ? appController.idCOuser.value
            : couser.value.id,
        name: nameController.text,
        lastName: lastnameController.text,
        legalDocument: docController.text,
        username: appController.usernameUser.value,
        birth: formattedBirth,
        email: appController.emailUser.value,
        cellPhone: appController.cellphoneUser.value

        // Usa a data formatada no padrão ISO 8601
        );

    // Chama o método de atualização no repositório
    final response = await repository.changeRegisterUser(updatedUser);

    // Lida com a resposta do repositório
    response.fold((error) {
      isLoading.value = false;
      _handleError(
          "Erro", 'Erro ao alterar seus dados, por favor tente novamente');
    }, (success) {
      isLoading.value = false;
      appController.getCoUserLogged();

      if (success.withError == true) {
        _handleError(
            "Erro", 'Erro ao alterar seus dados, por favor tente novamente');
      } else {
        couser.value = success.data ?? couser.value;

        Get.offAndToNamed(PageRoutes.profilepage);
        update();
        Get.snackbar(
          'Perfil atualizado com sucesso!',
          'Suas alterações foram salvas.',
          duration: const Duration(seconds: 5),
          snackStyle: SnackStyle.FLOATING,
          backgroundColor: BKOpenColors.statusGreen,
          colorText: BKOpenColors.white,
        );
      }
    });
  }

  // Método para salvar o país selecionado
  void selectCountry(CoCultureDto selectedCountry) {
    countrySelected.text = selectedCountry.name!;
  }

  // Método para salvar a personalidade selecionada
  void selectPersonality(String selectedPersonality) {
    personalitySelected.value = selectedPersonality;
  }

  String maskEmail(String email) {
    if (email.isEmpty || !email.contains('@')) {
      return '-';
    }
    final List<String> parts = email.split('@');
    final String username = parts[0];
    if (username.length < 2) {
      return '***@${parts[1]}';
    }
    final String maskedUsername = username.substring(0, 1) +
        '*' * (username.length - 2) +
        username.substring(username.length - 1);
    final String domain = parts[1];
    final String maskedDomain = '*' * (domain.length - 6) + domain.substring(6);
    return '$maskedUsername@$maskedDomain';
  }

  String maskPhone(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.length < 10) {
      return '-';
    }
    return '(**) *****-${phoneNumber.substring(9)}';
  }

  String formatPhone(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.length < 10) {
      return '-';
    }
    return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 7)}-${phoneNumber.substring(7)}';
  }

  String maskCPF(String? cpf) {
    if (cpf == null || cpf.length != 11) {
      return '-';
    }
    return '***.***.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }

  String formatCPF(String? cpf) {
    if (cpf == null || cpf.length != 11) {
      return '-';
    }
    return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9)}';
  }

  String maskBirthDate(String? birthDate) {
    if (birthDate == null || birthDate.length < 8) {
      return '-';
    }
    return '**/**/$birthDate.substring(8, 10)';
  }

  String formatBirthDate(String? birthDate) {
    if (birthDate == null || birthDate.length < 8) {
      return '-';
    }
    try {
      DateTime parsedDate = DateTime.parse(birthDate);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } catch (e) {
      return '-';
    }
  }

  void validatePassword(String password) {
    hasUpperCase.value = password.contains(RegExp(r'[A-Z]'));
    hasSpecialCharacter.value =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasNumbers.value = password.contains(RegExp(r'[0-9]'));
    hasMinLength.value = password.length >= 6;
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
}
