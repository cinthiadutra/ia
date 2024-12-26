import 'package:bkopen/home/controllers/home_controller.dart';
import 'package:get/get.dart';


class MenuBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());

  }

}