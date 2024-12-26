import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/ProposalsAndContracts/data/proposal_repository.dart';
import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/home/data/repositories/home_repository.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRepository>(HomeRepository());
    Get.put<WebSocketService>(WebSocketService());
    Get.put<ProposalRepository>(ProposalRepository());

    Get.put<ProposalController>(ProposalController());

    Get.put<HomeController>(HomeController());
  }
}
