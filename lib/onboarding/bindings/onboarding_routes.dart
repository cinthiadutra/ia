

import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/onboarding/bindings/onboarding_bindings.dart';
import 'package:bkopen/onboarding/views/onboarding_confirm.dart';
import 'package:bkopen/onboarding/views/onboarding_doc.dart';
import 'package:bkopen/onboarding/views/onboarding_midias.dart';
import 'package:bkopen/onboarding/views/onboarding_page.dart';
import 'package:bkopen/onboarding/views/onboarding_phone.dart';
import 'package:bkopen/onboarding/views/onbording_terms.dart';
import 'package:get/get.dart';

List<GetPage> onboardingRoutes = [
GetPage(
        page: () => OnboardingPage(),
        name: PageRoutes.onboardingpage,
        binding: OnboardingBindings()),
    GetPage(
        page: () => OnboardingPhone(),
        name: PageRoutes.onboardingpagephone,
        binding: OnboardingBindings()),
    GetPage(
        page: () => OnboardingConfirm(),
        name: PageRoutes.onboardingpageconfirm,
        binding: OnboardingBindings()),
    GetPage(
        page: () => OnboardingTerms(),
        name: PageRoutes.onboardingterms,
        binding: OnboardingBindings()),
    GetPage(
        page: () => OnboardingDoc(),
        name: PageRoutes.onboardingpagedoc,
        binding: OnboardingBindings()),
    GetPage(
        page: () => OnboardingMidias(),
        name: PageRoutes.onboardingpagemidia,
        binding: OnboardingBindings()),];