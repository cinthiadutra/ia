import 'package:bkopen/onboarding/controlllers/onboarding_controller.dart';
import 'package:bkopen/onboarding/data/onboarding_repository.dart';
import 'package:get/get.dart';

class OnboardingBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<OnboardingRepository>(OnboardingRepository());

    Get.put<OnboardingController>(OnboardingController());
  }
}
