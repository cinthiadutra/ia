import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/ProposalsAndContracts/data/proposal_repository.dart';
import 'package:get/get.dart';
import '../controllers/against_proposal_or_pending_detail.dart';

class AgainstProposalOrPendingDetailBindings extends Bindings {
  @override
  void dependencies() {
Get.put<ProposalRepository>(ProposalRepository());

    Get.put<AgainstProposalOrPendingDetailController>(
        AgainstProposalOrPendingDetailController());
    Get.put<ProposalAgainstController>(ProposalAgainstController(),
        permanent: true);
  }
}
