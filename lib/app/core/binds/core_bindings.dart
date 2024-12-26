import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/core/data/app_repository.dart';
import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/app/services/http_client/app_http.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/app/services/local_storage/local_storage_impl.dart';
import 'package:get/get.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LocalStorage>(LocalStorageImpl());
    Get.put<WebSocketService>(WebSocketService(), permanent: true);
    Get.put<AppHttp>(AppHttp());
    Get.put<AppRepository>(AppRepository());
    Get.put<AppController>(AppController(),permanent: true);
  }
}
