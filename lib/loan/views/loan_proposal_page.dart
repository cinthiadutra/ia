// // ignore_for_file: unused_local_variable

// import 'package:bkopen/app/routes/AppPages.dart';
// import 'package:bkopen/app/theme/bkopencolors.dart';
// import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
// import 'package:bkopen/loan/components/upload_photo_2.dart';
// import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../../app/Strings/strings.dart';
// import '../../app/components/button/bkopen_button.dart';
// import '../../app/components/loading/bkopen_loading.dart';
// import '../../app/widgets/text_inputs/complex_text_input.dart';
// import '../../app/spacing/bkopen_spacing.dart';
// import '../../app/theme/styles.dart';
// import '../components/spinner_options.dart';
// import '../components/upload_photo.dart';

// class LoanProposalPage extends StatelessWidget {
//   final controller = Get.find<LoanProposalController>();

//    LoanProposalPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     NumberFormat formatter =
//         NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);

//     return SafeArea(
//       child: Scaffold(
//         appBar: BKAppBar(label: "Realizar proposta"),
//         body: Obx(() {
//           if (controller.isLoading.value) {
//             return BKOpenLoading();
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   Flex(
//                     direction: Axis.vertical,
//                     children: [
//                       Column(
//                         children: [
//                           BKOpenSpacing.x24,
//                           BKOpenSpacing.x8,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Informações necessárias",
//                                 style: Styles.h4,
//                               ),
//                             ],
//                           ),
//                           BKOpenSpacing.x24,
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 child: Stack(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           top: Get.height * 0.015),
//                                       child: Divider(
//                                         color: BKOpenColors.greyTitleTab,
//                                       ),
//                                     ),
//                                     Center(
//                                       child: CircleAvatar(
//                                         radius: 20,
//                                         backgroundColor: BKOpenColors.primary,
//                                         child: Text(
//                                           "1",
//                                           style: Styles.h3Label,
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               BKOpenSpacing.x8,
//                               Text(
//                                 'Sessão 1',
//                                 style: Styles.labelStatusText
//                                     .copyWith(color: BKOpenColors.blackSub),
//                               )
//                             ],
//                           ),
//                           BKOpenSpacing.x24,
//                           Column(
//                             children: [
//                               UploadPhoto(
//                                 isPendent: false,
//                               ),
//                               BKOpenSpacing.x16,
//                               UploadPhoto2(
//                                 isPendent: false,
//                               ),
//                               BKOpenSpacing.x16,
//                               ComplexTextInput(
//                                 textCampo: "Informação do cliente",
//                                 isSecret: false,
//                                 //labelText: Strings.label_phone,
//                                 // focusNode: controller.phoneFocusNode,
//                                 //      textEditingController:controller.edtControllerAmount,
//                                 keyboardType: TextInputType.name,
//                                 textInputAction: TextInputAction.done,
//                                 hintText: Strings.hint_value_solicited,
//                                 onChanged: (String text) {
//                                   //   controller.amountString.value = controller.edtControllerAmount.text;
//                                   //    controller.amountDouble.value = controller.edtControllerAmount.doubleValue;
//                                 },
//                               ),
//                               BKOpenSpacing.x8,
//                               ComplexTextInput(
//                                 isSecret: false,
//                                 //labelText: Strings.label_phone,
//                                 // focusNode: controller.phoneFocusNode,
//                                 //     textEditingController:controller.edtControllerAmount,
//                                 keyboardType: TextInputType.name,
//                                 textInputAction: TextInputAction.done,
//                                 hintText: Strings.hint_value_solicited,
//                                 onChanged: (String text) {
//                                   //     controller.amountString.value = controller.edtControllerAmount.text;
//                                   //    controller.amountDouble.value = controller.edtControllerAmount.doubleValue;
//                                 },
//                               ),
//                               BKOpenSpacing.x8,
//                               ContainerWithSpinner(),
//                               BKOpenSpacing.x8,
//                               ContainerWithSpinner(),
//                               BKOpenSpacing.x8,
//                               ContainerWithSpinner(),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           }
//         }),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: BKOpenButton(
//             text: "Próximo",
//             imageRight:
//                 Icon(Icons.navigate_next, color: Colors.white, size: 16),
//             onTap: () {
//               Get.offAndToNamed(
//                 PageRoutes.loanproposalSendpage,
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
