import 'package:bkopen/auth/bindings/login_bindings.dart';
import 'package:bkopen/auth/components/recovery_password_success.dart';
import 'package:bkopen/auth/components/register_success.dart';
import 'package:bkopen/auth/views/authentication_page.dart';
import 'package:bkopen/auth/views/email_page.dart';
import 'package:bkopen/auth/views/recovery_password_page.dart';
import 'package:bkopen/auth/views/register_page.dart';
import 'package:bkopen/onboarding/bindings/onboarding_bindings.dart';
import 'package:bkopen/terms/politica.dart';
import 'package:bkopen/terms/terms.dart';
import 'package:get/get.dart';

import '../../app/core/binds/core_bindings.dart';
import '../../app/routes/AppPages.dart';
import '../views/login_page.dart';

List<GetPage> loginRoutes = [
    GetPage(
        page: () => LoginPage(),
        name: PageRoutes.loginpage,
        bindings: [LoginBindings(), OnboardingBindings(),CoreBindings() ]),
    GetPage(
        page: () => RegisterPage(),
        name: PageRoutes.registerpage,
        bindings: [LoginBindings(), OnboardingBindings(),CoreBindings()]),
    GetPage(
        page: () => Terms(), name: PageRoutes.terms, binding: LoginBindings()),
    GetPage(
        page: () => Politica(),
        name: PageRoutes.politica,
        binding: LoginBindings()),
    GetPage(
        page: () => AuthenticationPage(),
        name: PageRoutes.authenticationPage,
        bindings: [LoginBindings(), OnboardingBindings(),CoreBindings()]),
    // GetPage(
    //     page: () => AuthenticationPageProfile(),
    //     name: PageRoutes.authenticationPageProfile,
    //     bindings: [LoginBindings(), OnboardingBindings(), ProfileBindings()]),
    GetPage(
        page: () => RecoveryPasswordPage(),
        name: PageRoutes.recoverypasswordpage,
        bindings: [LoginBindings(), OnboardingBindings(),CoreBindings()]),
    GetPage(
        page: () => RecoveryPasswordSuccess(),
        name: PageRoutes.recoverypasswordsucess,
        bindings: [LoginBindings(), OnboardingBindings(),CoreBindings()]),
         GetPage(
        page: () => RegisterSuccess(),
        name: PageRoutes.registersucess,
        binding: LoginBindings()),
        GetPage(
        page: () => EmailPage(),
        name: PageRoutes.recoverypasswordemail,
        binding: LoginBindings()),
  
];
