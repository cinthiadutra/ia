// // ignore_for_file: collection_methods_unrelated_type

// import 'dart:async';

// import 'package:bkopen/app/enums/enum_emprestimos.dart';
// import 'package:bkopen/app/enums/enum_status_proposta.dart';
// import 'package:bkopen/loan/data/models/proposta_model.dart';
// import 'package:get/get.dart';

// class LoanOffersController extends GetxController {
//   Rx<bool> isLoading = Rx(true);
//   Rx<bool> isExpanded = Rx(true);
//   Rx<bool> isExpandedOffer = Rx(true);
//   Rx<bool> isExpandedOther = Rx(false);
//   Rx<bool> isExpandedOfferOther = Rx(true);

//   final selectedStatus = <StatusPropostaEnum>[].obs;



//   @override
//   void onInit() {
//     super.onInit();
 
//     loadPage(currentPage.value);
//     Timer(Duration(seconds: 3), () {
//       isLoading.value = false;
//     });
//     // Carrega as notificações
//   }

//   Rx<List<PropostasModel>> propostasToShow = Rx([]);
//   Rx<List<PropostasModel>> otherPropostasToShow = Rx([]);

//   Rx<List<PropostasModel>> listProposal = Rx([]);


//   void loadPage(int page) {
//     currentPage.value = page;
//     int start = (page - 1) * itemsPerPage.value;
//     int end = page * itemsPerPage.value;
//     if (end > listasPropostas.value.length) end = listasPropostas.value.length;

//     propostasToShow.value = listProposal.value.sublist(start, end);
//     otherPropostasToShow.value = listaOutrasPropostas.value.sublist(start, end);
//   }

//   int get totalPages =>
//       (listasPropostas.value.length / itemsPerPage.value).ceil();



//   Rx<int> currentPage = Rx(1);
//   Rx<int> itemsPerPage = Rx(3);






//   void filterByParcelas({bool menor = true}) {
//     if (menor) {
//       propostasToShow.value = listProposal.value.toList()
//         ..sort((a, b) => a.installmentValue.compareTo(b.installmentValue));
//     } else {
//       propostasToShow.value = listProposal.value.toList()
//         ..sort((a, b) => b.installmentValue.compareTo(a.installmentValue));
//     }
//   }

//   void filterPropostas(String query) {
//     if (query.isEmpty) {
//       loadPage(currentPage.value);
//     } else {
//       propostasToShow.value = listProposal.value
//           .where((proposta) =>
//               proposta.emprestimo.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   }

//   void toggleStatus(StatusPropostaEnum status) {
//     if (selectedStatus.contains(status)) {
//       selectedStatus.remove(status);
//     } else {
//       selectedStatus.add(status);
//     }
//     filterByStatus();
//   }

//   void filterProposals(String query) {
//     if (query.isEmpty) {
//       propostasToShow.value = listProposal.value;
//     } else {
//       propostasToShow.value = listProposal.value
//           .where((proposta) =>
//               proposta.emprestimo.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//   }

//   void filterByInterestRate(bool ascending) {
//     propostasToShow.value.sort((a, b) => ascending
//         ? a.interestRate.compareTo(b.interestRate)
//         : b.interestRate.compareTo(a.interestRate));
//   }

//   void filterByInstallmentValue(bool ascending) {
//     propostasToShow.value.sort((a, b) => ascending
//         ? a.installmentValue.compareTo(b.installmentValue)
//         : b.installmentValue.compareTo(a.installmentValue));
//   }

//   void filterByDateRange(String starts, String ends) {
//     var start = DateTime.parse(starts);
//     var end = DateTime.parse(ends);

//     propostasToShow.value = listProposal.value
//         .where((proposta) =>
//             proposta.firstInstallment.isAfter(start) &&
//             proposta.firstInstallment.isBefore(end))
//         .toList();
//   }

//   void filterByStatus() {
//     propostasToShow.value = listProposal.value.where((proposta) {
//       return selectedStatus.isEmpty || selectedStatus.contains(proposta.status);
//     }).toList();
//   }

// }