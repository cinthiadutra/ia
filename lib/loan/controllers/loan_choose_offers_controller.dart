import 'dart:async';

import 'package:get/get.dart';

class LoanChooserOffersController extends GetxController {
  RxBool isLoading = true.obs;

 
  @override
  void onInit() {
    super.onInit();

    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    // Carrega as notificações
  }
}
