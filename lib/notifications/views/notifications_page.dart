import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/AppPages.dart';
import '../../app/theme/styles.dart';
import '../controllers/notifications_controller.dart';

class NotificationsPage extends GetView<AppController> {
  final Rx<bool> isNew = Rx(true);
  final ws = Get.find<WebSocketService>();
  final ntf = Get.find<NotificationsController>();

  NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
        init: controller,
        initState: (_) {},
        builder: (_) {
          return SafeArea(
              child: Scaffold(
            appBar: BKAppBar(label: "Notificações"),
            backgroundColor: BKOpenColors.backgroudNotif,
            body: Column(
              children: [
                Obx(
                  () {
                    if (ws.messageList.value.isEmpty) {
                      return SizedBox(
                          height: Get.height * .75,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.messageAll.value.length,
                                  itemBuilder: (context, i) {
                                    var msg = controller.messageAll.value[i];

                                    return ListTile(
                                      tileColor: BKOpenColors.backgroudNotifNew,
                                      title: Text(msg.subject ?? '',
                                          style: Styles.textForm.copyWith(
                                              color: BKOpenColors.darkGrey)),
                                      subtitle: Text(
                                        msg.message ?? '',
                                        style: Styles.textDetails.copyWith(
                                            color: BKOpenColors.darkGrey),
                                      ),
                                      onTap: () {
                                        ntf.markAsRead(i);
                                        Get.toNamed(
                                          PageRoutes.notificationdetailspage,
                                          arguments: msg,
                                        );
                                      },
                                    );
                                  })));
                    } else {
                      return SizedBox(
                          height: Get.height * .75,
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: ws.messageList.value.length,
                                  itemBuilder: (context, i) {
                                    var msg = ws.messageList.value[i];

                                    final notification = NotificationItem(
                                      title: msg.subject ?? '',
                                      message: msg.message ?? '',
                                      isRead: false,
                                    );

                                    return ListTile(
                                      tileColor: notification.isRead
                                          ? BKOpenColors.backgroudNotif
                                          : BKOpenColors.backgroudNotifNew,
                                      title: Text(
                                        notification.title,
                                        style: notification.isRead
                                            ? Styles.textForm.copyWith(
                                                color: BKOpenColors.darkGrey)
                                            : Styles.textForm.copyWith(
                                                color: BKOpenColors.secondary),
                                      ),
                                      subtitle: Text(
                                        notification.message,
                                        style: Styles.textDetails.copyWith(
                                            color: BKOpenColors.darkGrey),
                                      ),
                                      onTap: () {
                                        ntf.markAsRead(i);
                                        Get.toNamed(
                                          PageRoutes.notificationdetailspage,
                                          arguments: notification,
                                        );
                                      },
                                    );
                                  })));
                    }
                  },
                ),
              ],
            ),
          ));
        });
  }
}

class NotificationItem {
  final String title;
  final String message;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.message,
    required this.isRead,
  });
}
