import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/ProposalsAndContracts/data/proposal_repository.dart';
import 'package:get/get.dart';

import '../controllers/proposal_controller.dart';


class ProfileProposalAndContractsBindings extends Bindings{
  @override
  void dependencies() {
   Get.put<ProposalRepository>(ProposalRepository());

    Get.put<ProposalController>(ProposalController());
    Get.put<ProposalAgainstController>(ProposalAgainstController(), permanent: true);


  }

}