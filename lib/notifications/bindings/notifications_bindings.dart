import 'package:bkopen/notifications/controllers/notification_settings_controller.dart';
import 'package:get/get.dart';
import '../controllers/notifications_controller.dart';

class NotificationsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NotificationsController>(NotificationsController());
    Get.put<NotificationSettingsController>(NotificationSettingsController());
  }
}
