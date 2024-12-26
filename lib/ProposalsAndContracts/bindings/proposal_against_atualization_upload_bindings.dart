import 'package:bkopen/ProposalsAndContracts/data/proposal_repository.dart';
import 'package:get/get.dart';

import '../../loan/controllers/loan_proposal_controller.dart';

class ProposalAgainstBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProposalRepository>(ProposalRepository());

    Get.put<LoanProposalController>(LoanProposalController());
  }
}
