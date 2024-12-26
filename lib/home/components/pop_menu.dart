import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/notifications/controllers/notifications_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/components/button/bkopen_button.dart';
import '../../app/theme/bkopencolors.dart';
import '../../app/theme/styles.dart';

void showPopupMenu(BuildContext context) {
  final controller = Get.find<WebSocketService>();
  final appcontroller = Get.find<AppController>();

  final nf = Get.find<NotificationsController>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: 45, // Define a distância do topo
            right: 15, // Define a distância da direita
            child: Material(
              color: Colors.transparent, // Deixar o fundo transparente
              child: SizedBox(
                width: 350, // Largura do AlertDialog
                height: 400, // Altura do AlertDialog
                child: AlertDialog(
                  title: Text("Notificações",
                      textAlign: TextAlign.start,
                      style: Styles.textForm
                          .copyWith(color: BKOpenColors.secondary)),
                  content: Column(
                    children: [
                      // Lista de notificações
                      controller.messageList.value.isNotEmpty
                          ? Expanded(
                              flex: 1,
                              child: ListView.builder(
                                itemCount:
                                    controller.messageList.value.length > 3
                                        ? 3
                                        : controller.messageList.value.length,
                                itemBuilder: (context, index) {
                                  final notification =
                                      controller.messageList.value[index];
                                  return ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Text(
                                        notification.subject ?? '',
                                        style: Styles.textDetails.copyWith(
                                            color: BKOpenColors.darkGrey,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notification.message ?? '',
                                          style: Styles.subTextDetails,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: BKOpenColors.borderGrey2,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      nf.markAsRead(index);
                                      Get.toNamed(
                                          PageRoutes.notificationdetailspage,
                                          arguments: notification);
                                    },
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: ListView.builder(
                                itemCount:
                                    appcontroller.messageAll.value.length > 3
                                        ? 3
                                        : appcontroller.messageAll.value.length,
                                itemBuilder: (context, index) {
                                  final notification =
                                      appcontroller.messageAll.value[index];
                                  return ListTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: Text(
                                        notification.subject ?? '',
                                        style: Styles.textDetails.copyWith(
                                            color: BKOpenColors.darkGrey,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notification.message ?? '',
                                          style: Styles.subTextDetails,
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: BKOpenColors.borderGrey2,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      nf.markAsRead(index);
                                      Get.toNamed(
                                          PageRoutes.notificationdetailspage,
                                          arguments: notification);
                                    },
                                  );
                                },
                              ),
                            ),
                      Divider(
                        thickness: 1,
                        color: BKOpenColors.greyTitleTab,
                      ),
                      BKOpenButton(
                        height: 34,
                        imagePadding: 1,
                        text: "Central de Notificações",
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        imageRight: Icon(
                          Icons.notifications_outlined,
                          color: BKOpenColors.white,
                          size: 20,
                        ),
                        textStyle: Styles.textDetails
                            .copyWith(color: BKOpenColors.white),
                        onTap: () {
                          appcontroller.getNotification();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
