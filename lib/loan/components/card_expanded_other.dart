// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:bkopen/app/spacing/bkopen_spacing.dart';
// import 'package:bkopen/app/theme/bkopencolors.dart';
// import 'package:bkopen/app/theme/styles.dart';
// import 'package:bkopen/loan/components/payment_details_widget.dart';
// import 'package:bkopen/loan/controllers/loan_offers_controller.dart';
// import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
// import 'package:bkopen/loan/data/models/proposta_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CardExpandedOther extends GetView<LoanProposalController> {
//   final title;

//   CardExpandedOther(this.title, {super.key});
//   final wt = Get.width;
//   final ht = Get.height;
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Container(
//           padding: EdgeInsets.only(left: 8, right: 8),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey[300]!),
//           ),
//           child: ListView(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     title ?? 'Outras ofertas',
//                     style: Styles.buttonLabel.copyWith(
//                         color: controller.isExpandedOther.value
//                             ? BKOpenColors.primary
//                             : BKOpenColors.primary.withOpacity(.5)),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       controller.isExpandedOther.value =
//                           !controller.isExpandedOther.value;
//                     },
//                     icon: Icon(controller.isExpandedOther.value
//                         ? Icons.expand_less
//                         : Icons.expand_more),
//                   ),
//                 ],
//               ),
//               AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 height: controller.isExpandedOther.value == false ? 0 : null,
//                 child: GetBuilder<LoanProposalController>(
//                   init: controller,
//                   initState: (_) {},
//                   builder: (_) {
//                     return ListView(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       children: [
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: ScrollPhysics(),
//                           itemCount:
//                               controller.listPropostasSimuladas?.data?.length,
//                           itemBuilder: (context, index) {
//                             var outras =
//                                 controller.listPropostasSimuladas?.data?[index];
//                             return PaymentDetailsWidget(
//                               model: controller
//                                   .listPropostasSimuladas!.data![index],
//                               ontap: () {},
//                             );
//                           },
//                         ),
//                         GetBuilder<LoanOffersController>(
//                           builder: (controller) {
//                             return Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: List.generate(
//                                     controller.totalPages,
//                                     (index) => Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 4.0),
//                                         child: InkWell(
//                                           onTap: () =>
//                                               controller.loadPage(index + 1),
//                                           child: Container(
//                                             width: 28,
//                                             height: 28,
//                                             decoration: BoxDecoration(
//                                               color: controller
//                                                           .currentPage.value ==
//                                                       index + 1
//                                                   ? BKOpenColors.page
//                                                       .withOpacity(0.5)
//                                                   : BKOpenColors.page,
//                                               border: Border.all(
//                                                 color: controller.currentPage
//                                                             .value ==
//                                                         index + 1
//                                                     ? Colors.transparent
//                                                     : BKOpenColors.page,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                             child: Center(
//                                               child: Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(5.0),
//                                                 child: Text(
//                                                   '${index + 1}',
//                                                   style: Styles.textDetails
//                                                       .copyWith(
//                                                           fontSize: 10,
//                                                           color: BKOpenColors
//                                                               .white,
//                                                           fontWeight:
//                                                               FontWeight.w700),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ))));
//                           },
//                         ),
//                         BKOpenSpacing.x16
//                       ],
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
