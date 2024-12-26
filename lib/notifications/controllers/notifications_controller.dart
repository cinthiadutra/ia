import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/notifications/data/models/ex_co_websoxket_dto.dart';
import 'package:get/get.dart';

import '../components/notification_item.dart';

class NotificationsController extends GetxController {
  RxBool isLoading = true.obs;
  final controller = Get.find<AppController>();
  Rx<List<NotificationItem>> listNotifications = Rx([
    NotificationItem(
        title: 'Chegou uma contra proposta para Home Equity',
        message: 'Veja os detalhes acessando Propostas e Contratos',
        isRead: false),
    NotificationItem(
        title: 'Chegou uma contra proposta para Empréstimo pessoal',
        message: 'Veja os detalhes acessando Propostas e Contratos',
        isRead: false)
  ]);
  final Rx<ExCoWebSocketDto>? excowebsocketdto =
      Rx(ExCoWebSocketDto(payload: {},));
  @override
  void onInit() {
    super.onInit();
    // Carrega as notificações
    controller.getNotification();
  }

  // Método para carregar as notificações
  

  // Método para marcar uma notificação como lida
  void markAsRead(int index) {
    listNotifications.value[index].isRead = true;
  }
}
