import 'package:bkopen/ProposalsAndContracts/components/pendency_success%20copy.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/loan/bindings/loan_proposal_bindings.dart';
import 'package:bkopen/loan/components/loan_proposal_send.dart';
import 'package:bkopen/loan/views/loan_01_value_solicited_page.dart';
import 'package:bkopen/loan/views/loan_02_options_page.dart';
import 'package:bkopen/loan/views/loan_03_solicited_infos_page.dart';
import 'package:bkopen/loan/views/loan_05_choose_offers_page.dart';
import 'package:bkopen/loan/views/loan_07_offers_page.dart';
import 'package:bkopen/loan/views/loan_08_%20resume_proposal_page.dart';
import 'package:bkopen/profile/bindings/profile_bindings.dart';
import 'package:get/get.dart';

import '../../ProposalsAndContracts/bindings/proposal_against_atualization_upload_bindings.dart';
import '../views/loan_06_solicited_infos_simuled_page.dart';

List<GetPage> loanRoutes = [
  GetPage(
      page: () => LoanValueSolicitedPage(),
      name: PageRoutes.loanvaluesolicitedpage,
      binding: LoanProposalBindings()),
  GetPage(
      page: () => LoanOptionsPage(),
      name: PageRoutes.loanoptionspage,
      bindings: [LoanProposalBindings(), ProfileBindings()]),
  GetPage(
    page: () => LoanSolicitedInfosPage(),
    name: PageRoutes.loansolicitedinfospage,
    binding: LoanProposalBindings(),
  ),
  GetPage(
      page: () => LoanSolicitedInfosSimuledPage(),
      name: PageRoutes.loansolicitedinfossimuledpage,
      binding: LoanProposalBindings()),
  // GetPage(
  //     page: () => LoanGetOffersPage(),
  //     name: PageRoutes.loangetofferspage,
  //     binding: LoanProposalBindings()),
  GetPage(
      page: () => LoanChooseOffersPage(),
      name: PageRoutes.loanchooseofferspage,
      binding: LoanProposalBindings()),
  GetPage(
      page: () => LoanOffersPage(),
      name: PageRoutes.loanofferspage,
      binding: LoanProposalBindings()),
  // GetPage(
  //     page: () => LoanProposalPage(),
  //     name: PageRoutes.loanproposalpage,
  //     bindings: [LoanProposalBindings(), ProposalAgainstBindings()]),
  GetPage(
      page: () => LoanResumeProposalPage(),
      name: PageRoutes.loanproposalresumepage,
      bindings: [LoanProposalBindings()]),
  GetPage(
      page: () => LoanProposalSend(),
      name: PageRoutes.loanproposalSendpage,
      binding: LoanProposalBindings()),
  GetPage(
      page: () => PendencySendSucess(),
      name: PageRoutes.pendencyproposalSendpage,
      binding: ProposalAgainstBindings()),
];
