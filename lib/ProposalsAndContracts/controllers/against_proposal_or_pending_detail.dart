import 'dart:async';

import 'package:get/get.dart';

class AgainstProposalOrPendingDetailController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isExpanded = true.obs;

  RxBool uploadPhotoVisible = true.obs;

  @override
  void onInit() {
    super.onInit();

    Timer(Duration(seconds: 3),(){
      isLoading.value = false;
    });
    // Carrega as notificações
  }

 
}

