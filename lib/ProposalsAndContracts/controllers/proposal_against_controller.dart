import 'dart:async';
import 'dart:io';

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/ProposalsAndContracts/models/message.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class ProposalAgainstController extends GetxController {
  Rx<bool> uploadPhotoVisible = true.obs;
  Rx<bool> isPendent = false.obs;

  Rx<String> mensagemEnviada = Rx('');
  var imagePath = ''.obs;
  var imagePath2 = ''.obs;

  var isImageSaved = false.obs;
  var isImageSaved2 = false.obs;

  var imagePathPendent = ''.obs;
  var isImageSavedPendent = false.obs;

    var imagePathPendent2 = ''.obs;
  var isImageSavedPendent2 = false.obs;
  final formKey = GlobalKey<FormState>();

  Rx<bool> isLoading = Rx(true);
  Rx<bool> isExpanded = Rx(true);
  Rx<bool> isShow = Rx(true);
  final ScrollController scrollController = ScrollController();
  List<Message> get messages => mensagens;
  final List<Message> mensagens = [
    Message(sender: 'Atendente', text: 'Olá! Como posso ajudar?'),
    Message(
        sender: 'Usuário',
        text: 'Gostaria de mais informações sobre o emprestímo pessoal.'),
    Message(sender: 'Atendente', text: 'Claro, qual seria a sua dúvida?'),
    Message(
        sender: 'Usuário',
        text:
            'Quero informações sobre juros pegando o emprestímo para pagar em 36x.'),
    Message(
        sender: 'Atendente',
        text: 'A taxa de juros gira em torno de 2% ao mês.'),
    Message(
        sender: 'Usuário',
        text:
            'Ótimo!Vou continuar o processo de solicitação do emprestímo,obrigada!'),
  ];

  late TextEditingController message = TextEditingController();
  Rx <bool> isTyping = Rx(false);

  @override
  void onInit() {
    super.onInit();

    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    
    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    // Carrega as notificações
  }

  void uploadPhoto() {
    if (uploadPhotoVisible.value) {
      uploadPhotoVisible.value = false;
    } else {
      uploadPhotoVisible.value = true;
    }
  }

  var filePath = ''.obs;

  Future<void> pickFile(bool isPendent) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      await saveFile(file, isPendent);
    }
  }

  Future<void> pickFile2(bool isPendent) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      await saveFile2(file, isPendent);
    }
  }

  Future<void> saveFile2(File file, bool isPendent) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final File newFile =
          await file.copy('$appDocPath/${file.path.split('/').last}');
      if (isPendent) {
        imagePathPendent2.value = newFile.path;
        isImageSavedPendent2.value = true;
      } else {
        imagePath2.value = newFile.path;
        isImageSaved2.value = true;
      }
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao salvar o arquivo: $e',duration: Duration(seconds: 3),colorText: Colors.white,backgroundColor: Colors.red);
    }
  }
  Future<void> saveFile(File file, bool isPendent) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      final File newFile =
          await file.copy('$appDocPath/${file.path.split('/').last}');
      if (isPendent) {
        imagePathPendent.value = newFile.path;
        isImageSavedPendent.value = true;
      } else {
        imagePath.value = newFile.path;
        isImageSaved.value = true;
      }
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao salvar o arquivo: $e',duration: Duration(seconds: 3),colorText: Colors.white,backgroundColor: Colors.red);
    }
  }

  void sendMessage(String text) {
    if(text.isNotEmpty) {
      messages.add(Message(sender: 'Usuário', text: text));
    }
    isTyping.value = false;

    refresh();
    // Aqui você pode adicionar lógica para enviar a mensagem para o servidor
  }

  Future<void> showInfoDialog(bool isPendent) async {
    Get.defaultDialog(
    
      
        actions: [
          BKOpenButton(
            height: 40,
              text: "Enviar foto/arquivo",
              backgroundColor: BKOpenColors.secondary,
              onTap: () {
                Get.back();

                pickFile(isPendent);
              }),
        ],
        contentPadding: EdgeInsets.all(10),
        title: 'Como enviar seu documento',
        
        titleStyle: Styles.h4.copyWith(
          color: BKOpenColors.secondary,
        ),
        content: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: BKOpenColors.primary,
                    ),SizedBox(width: 5,),
                    Text('Instrução de envio'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: BKOpenColors.primary,
                    ),SizedBox(width: 5,),
                    Text('Instrução de envio'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: BKOpenColors.primary,
                    ),
                    SizedBox(width: 5,),
                    Text('Instrução de envio'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 3,
                      backgroundColor: BKOpenColors.primary,
                    ),SizedBox(width: 5,),
                    Text('Instrução de envio'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            Positioned(
            top: -8.0,
            right: 8.0,
            child: GestureDetector(
              onTap: () {
                Get.back(); // Fecha o diálogo
              },
              child: Icon(
                Icons.close,
                size: 24.0,
              ),
            ),
          ),
          ],
        ),
        buttonColor: BKOpenColors.secondary,
        barrierDismissible: true,
        radius: 6);
  }
}
