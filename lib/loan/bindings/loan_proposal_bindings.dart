import 'package:bkopen/loan/data/loan_repository.dart';
import 'package:get/get.dart';

import '../controllers/loan_proposal_controller.dart';

class LoanProposalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoanRepository>(LoanRepository());

    Get.put<LoanProposalController>(LoanProposalController(), permanent: true);
  }
}
