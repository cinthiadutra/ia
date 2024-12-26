import 'package:bkopen/profile/data/profile_repository.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileRepository>(ProfileRepository());
    Get.put<ProfileController>(ProfileController());
  }
}
