import 'package:bkopen/ProposalsAndContracts/bindings/against_proposal_or_pending_detail_bindings.dart';
import 'package:bkopen/ProposalsAndContracts/bindings/profile_proposal_and_contracts_bindings.dart';
import 'package:bkopen/ProposalsAndContracts/bindings/proposal_against_atualization_upload_bindings.dart';
import 'package:bkopen/ProposalsAndContracts/bindings/proposal_bindings.dart';
import 'package:bkopen/ProposalsAndContracts/components/proposal_success.dart';
import 'package:bkopen/ProposalsAndContracts/views/profile_proposal_and_contracts_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_01_value_solicited_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_02_options_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_03_solicited_infos_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_05_choose_offers_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_07_offers_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_against/against_proposal_or_pending__detail_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_against/details_proposal_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_against/proposal_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_pending/proposal_against_atualization_chat_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_pending/proposal_against_atualization_upload_page.dart';
import 'package:bkopen/ProposalsAndContracts/views/proposal_update_info.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/home/bindings/home_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../../home/views/detalhe_resume_proposal_page.dart';
import '../views/proposal_pending/proposal_against_atualization_options_page.dart';

List<GetPage> proposalRoutes = [
  GetPage(
      page: () => ProposalPage(),
      name: PageRoutes.proposalpage,
      binding: ProposalBindings()),
  GetPage(
    page: () => DetailsProposalPage(),
    name: PageRoutes.proposaldetailspage,
    binding: ProposalBindings(),
  ),
  GetPage(
      page: () => AgainstProposalOrPendingDetailPage(),
      name: PageRoutes.againstproposalorpendingdetailgpage,
      bindings: [AgainstProposalOrPendingDetailBindings(), ProposalBindings()]),
  GetPage(
      page: () => ProposalAgainstAtualizationOptionsPage(),
      name: PageRoutes.proposalagainstatualizationoptionspage,
      bindings: [ProposalAgainstBindings(), ProposalBindings()]),
  GetPage(
      page: () => ProposalAgainstAtualizationChatPage(),
      name: PageRoutes.proposalagainstatualizationchatpage,
      bindings: [ProposalAgainstBindings(), ProposalBindings()]),
  GetPage(
    page: () => ProfileProposalAndContractsPage(),
    name: PageRoutes.profileproposalandcontractspage,
    bindings: [ProfileProposalAndContractsBindings(), ProposalBindings()],
  ),
  GetPage(
      page: () => ProposalAgainstAtualizationUploadPage(),
      name: PageRoutes.proposalagainstatualizationuploadpage,
      bindings: [ProposalAgainstBindings(), ProposalBindings()]),
  GetPage(
      page: () => ProposalSendSucess(),
      name: PageRoutes.proposalpageSucess,
      bindings: [ProposalAgainstBindings(), ProposalBindings()]),
  GetPage(
      page: () => DetailLastProposalPage(),
      name: PageRoutes.detailslastloanpage,
      bindings: [HomeBindings(), ProposalBindings()]),
  GetPage(
      page: () => ProposalValueSolicitedPage(),
      name: PageRoutes.proposalvaluesolicitedpage,
      bindings: [ProposalBindings()]),
  GetPage(
      page: () => ProposalUpdateInfo(),
      name: PageRoutes.proposalUpdateInfo,
      bindings: [ProposalBindings()]),
  GetPage(
      page: () => ProposalProductPage(),
      name: PageRoutes.proposalproductpage,
      bindings: [ProposalBindings()]),
  GetPage(
      page: () => ProposalSolicitedInfosPage(),
      name: PageRoutes.proposalsolicitedinfospage,
      bindings: [ProposalBindings()]),
  GetPage(
      page: () => ProposalChooseOffersPage(),
      name: PageRoutes.proposalsimulatefields,
      bindings: [ProposalBindings()]),
  GetPage(
      page: () => ProposalOffersPage(),
      name: PageRoutes.proposalOffersPage,
      bindings: [ProposalBindings()]),
];
