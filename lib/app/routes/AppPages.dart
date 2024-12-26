// ignore_for_file: file_names

import 'package:bkopen/ProposalsAndContracts/bindings/proposal_bindings.dart';
import 'package:bkopen/app/components/view_erro/page_error.dart';
import 'package:bkopen/app/core/binds/core_bindings.dart';
import 'package:bkopen/app/core/data/ex_co_notification_dto.dart';
import 'package:bkopen/auth/bindings/login_routes.dart';
import 'package:bkopen/init/bindings/init_bindings.dart';
import 'package:bkopen/init/views/init_page.dart';
import 'package:bkopen/loan/bindings/loan_routes.dart';
import 'package:bkopen/menu/views/menu_page.dart';
import 'package:bkopen/onboarding/bindings/onboarding_routes.dart';

import 'package:bkopen/profile/bindings/profile_routes.dart';
//import 'package:bkopen/proposal_pending%20%20/bindings/proposal_against_atualization_chat_bindings.dart';
//import 'package:bkopen/proposal_pending%20%20/ui/proposal_against_atualization_options_page.dart';
import 'package:get/get.dart';
import '../../ProposalsAndContracts/bindings/proposal_routes.dart';
import '../../home/bindings/home_bindings.dart';
import '../../home/views/home_page.dart';
import '../../loan/bindings/loan_proposal_bindings.dart';
import '../../notifications/bindings/notifications_bindings.dart';
import '../../notifications/views/notification_details.dart';
import '../../notifications/views/notification_settings.dart';
import '../../notifications/views/notifications_page.dart';
import '../../profile/bindings/profile_bindings.dart';
//import '../../proposal_pending  /bindings/proposal_against_atualization_options_bindings.dart';
//import '../../proposal_pending  /bindings/proposal_against_atualization_upload_bindings.dart';
//import '../../proposal_pending  /ui/proposal_against_atualization_chat_page.dart';
//import '../../proposal_pending  /ui/proposal_against_atualization_upload_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    ...loginRoutes,
    ...profileRoutes,
    ...loanRoutes,
    ...onboardingRoutes,
    ...proposalRoutes,
    GetPage(
        page: () => InitPage(),
        name: PageRoutes.initpage,
        binding: InitBindings()),
    GetPage(page: () => HomePage(), name: PageRoutes.homepage, bindings: [
      ProposalBindings(),
      ProfileBindings(),
      HomeBindings(),
      NotificationsBindings(),
      LoanProposalBindings(),
      CoreBindings()
    ]),
    GetPage(
        page: () => NotificationsPage(),
        name: PageRoutes.notificationspage,
        bindings: [NotificationsBindings(), CoreBindings()]),
    GetPage(
        page: () => NotificationDetailsPage(
              item: Get.arguments as ExCoNotificationDto,
            ),
        name: PageRoutes.notificationdetailspage,
        bindings: [NotificationsBindings(), CoreBindings()]),
    GetPage(
        page: () => NotificationSettingsPage(),
        name: PageRoutes.notificationsettingspage,
        bindings: [NotificationsBindings(), CoreBindings()]),
    GetPage(
        page: () => MenuPage(),
        name: PageRoutes.menupage,
        binding: HomeBindings()),
    GetPage(
        page: () => PageError(),
        name: PageRoutes.pageerror,
        binding: HomeBindings()),
  ];
}

abstract class PageRoutes {
  static const String loginpage = '/loginpage';
  static const String registerpage = '/registerpage';
  static const String terms = '/terms';
  static const String politica = '/politica';
  static const String proposalUpdateInfo = '/proposalUpdateInfo';
  static const String proposalOffersPage = '/proposalOffersPage';

  static const String registersucess = '/registersucess';
  static const String recoverypasswordemail = '/recoverypasswordemail';
  static const String recoverypasswordsucess = '/recoverypasswordsucess';

  static const String authenticationPage = '/authenticationPage';
  static const String authenticationPageProfile = '/authenticationPageProfile';

  static const String recoverypasswordpage = '/recoverypasswordpage';
  static const String initpage = '/initpage';
  static const String homepage = '/homepage';
  static const String loanvaluesolicitedpage = '/loanvaluesolicitedpage';
  static const String loanoptionspage = '/loanoptionspage';
  static const String loansolicitedinfospage = '/loansolicitedinfospage';
  static const String loangetofferspage = '/loangetofferspage';
  static const String notificationspage = '/notificationspage';
  static const String notificationdetailspage = '/notificationdetailspage';
  static const String notificationsettingspage = '/notificationsettingspage';
  static const String loanchooseofferspage = '/loanchooseofferspage';
  static const String loanofferspage = '/loanofferspage';
  static const String loanproposalpage = '/loanproposalpage';
  static const String loanproposalSendpage = '/loanproposalSendpage';
  static const String pendencyproposalSendpage = '/pendencyproposalSendpage';

  static const String profilepage = '/profilepage';
  static const String profileeditpage = '/profileeditpage';

  static const String menupage = '/menupage';
  static const String pageerror = '/pageerror';
  static const String detailslastloanpage = '/detailslastloanpage';

  static const String recoverypasswordprofilepage =
      '/recoverypasswordprofilepage';
  static const String proposalpage = '/proposalpagepage';
  static const String counterproposalpage = '/counterprwoposalpage';

  static const String loanproposalresumepage = '/loanproposalresumepage';

  static const String proposalpageSucess = '/proposalpagepageSucess';
  static const String againstproposalorpendingdetailgpage =
      '/againstproposalorpendingdetailgpage';
  static const String proposalagainstatualizationoptionspage =
      '/proposalagainstatualizationoptionspage';
  static const String proposalagainstatualizationuploadpage =
      '/proposalagainstatualizationuploadpage';
  static const String proposalagainstatualizationchatpage =
      '/proposalagainstatualizationchatpage';
  static const String profileproposalandcontractspage =
      '/profileproposalandcontractspage';
  static const String loansolicitedinfossimuledpage =
      '/loansolicitedinfossimuledpage';

  ///onboarding
  static const String onboardingpage = '/onboardingpage';
  static const String onboardingpagephone = '/onboardingpagephone';
  static const String onboardingpageconfirm = '/onboardingpageconfirm';
  static const String onboardingterms = '/onboardingterms';
  static const String onboardingpagedoc = '/onboardingpagedoc';

  static const String onboardingchangeplano = '/onboardingchangeplano';

  static const String onboardingchangeinfopaymentdata =
      '/onboardingchangeinfopaymentdata';
  static const String onboardingchangeinfopaymentresume =
      '/onboardingchangeinfopaymentresume';
  static const String onboardingchangeinfopaymentpix =
      '/onboardingchangeinfopaymentpix';
  static const String onboardingpagemidia = '/onboardingpagemidia';

  static const String proposalvaluesolicitedpage =
      '/proposalvaluesolicitedpage';
  static const String proposalproductpage = '/proposalproductpage';
  static const String proposalsolicitedinfospage =
      '/proposalsolicitedinfospage';
  static const String proposalsimulatefields = '/proposalsimulatefields';
  static const String proposaldetailspage = '/proposaldetailspage';
}
