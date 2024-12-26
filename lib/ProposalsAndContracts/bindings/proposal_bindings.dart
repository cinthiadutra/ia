import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/ProposalsAndContracts/data/proposal_repository.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/loan_repository.dart';
import 'package:get/get.dart';

class ProposalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoanRepository>(LoanRepository());
    Get.put<LoanProposalController>(LoanProposalController(), permanent: true);
    Get.put<ProposalRepository>(ProposalRepository());

    Get.put<ProposalController>(ProposalController(), permanent: true);

    Get.put<ProposalAgainstController>(ProposalAgainstController(),
        permanent: true);
  }
}
