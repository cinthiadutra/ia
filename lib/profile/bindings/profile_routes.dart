import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/onboarding/bindings/onboarding_bindings.dart';
import 'package:bkopen/profile/bindings/profile_bindings.dart';
import 'package:bkopen/profile/views/profile_edit.dart';
import 'package:bkopen/profile/views/profile_page.dart';
import 'package:bkopen/profile/views/recovery_password_profile_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage> profileRoutes = [
   GetPage(
        page: () => ProfilePage(),
        name: PageRoutes.profilepage,
        binding: ProfileBindings()),
    GetPage(
        page: () => ProfileEdit(),
        name: PageRoutes.profileeditpage,
        bindings: [ProfileBindings(), OnboardingBindings()]),
    GetPage(
        page: () => RecoveryPasswordProfilePage(),
        name: PageRoutes.recoverypasswordprofilepage,
        bindings: [ProfileBindings(), OnboardingBindings()]),
];