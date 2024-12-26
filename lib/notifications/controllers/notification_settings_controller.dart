import 'dart:async';

import 'package:get/get.dart';

import '../components/notification_item.dart';

class NotificationSettingsController extends GetxController {
  RxBool isLoading = true.obs;
  late NotificationItem notification;

  RxString title = ''.obs;
  @override
  void onInit() {
    super.onInit();

    Timer(Duration(seconds: 3),(){
      isLoading.value = false;
    });
    // Carrega as notificações
  }
}

