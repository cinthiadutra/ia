import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/AppPages.dart';
import '../bkopen_navbar.dart';

class BKOpenNavbarComponent extends StatelessWidget {

 // Usuario? usuario;
 // this.usuario

  const BKOpenNavbarComponent({super.key,});

  @override
  Widget build(BuildContext context) {
  //  final EventLoggerRepository _eventLoggerRepository =
  //  EventLoggerRepository();

   // int index = -1;
    int index = 0;

    switch (Get.currentRoute) {
      case PageRoutes.homepage:
        index = 0;
        break;
      case PageRoutes.profilepage:
        index = 1;
        break;
      case PageRoutes.notificationsettingspage:
        index = 2;
        break;
      case PageRoutes.proposalagainstatualizationchatpage:
        index = 3;
        break;
      case PageRoutes.menupage:
        index = 4;
        break;
      default:
    }
    return BKOpenNavbar(
      selectedIndex: index,
      onTapHome: () {
        Get.offAndToNamed(PageRoutes.homepage);
      },
      onTapConfig: () {
        Get.toNamed(PageRoutes.notificationsettingspage);
      //  Get.offAndToNamed(PageRoutes.offerspage,arguments: usuario);
      },
      onTapProfile: () {
        Get.toNamed(PageRoutes.profilepage);

      },
      onTapHelp: () {
                Get.toNamed(PageRoutes.proposalagainstatualizationchatpage);

      },
      onTapMenu: () {
             Get.toNamed(PageRoutes.menupage);
      },
    );
  }
}
