import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/core/data/ex_co_notification_dto.dart';

class NotificationDetailsPage extends GetView<AppController> {
  NotificationDetailsPage({super.key, required this.item});
  final ExCoNotificationDto item;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Notificações"),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              children: <Widget>[
                BKOpenSpacing.x16,
                Container(
                  color: Colors
                      .grey[200], // Define a cor de fundo como cinza claro
                  child: ListTile(
                    title: Text(item.subject ?? '',
                        style: Styles.labelStatusText
                            .copyWith(color: BKOpenColors.secondary)),
                    subtitle: Text(item.message ?? ''),
                    subtitleTextStyle: Styles.textDetails
                        .copyWith(color: BKOpenColors.blackSub),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
