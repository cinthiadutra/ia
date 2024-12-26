import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/auth/controllers/login_controller.dart';
import 'package:bkopen/auth/data/repositories/login_repository_imp.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginRepository>(LoginRepository());
    Get.put<WebSocketService>(WebSocketService());

    Get.put<LoginController>(LoginController());
  }
}
