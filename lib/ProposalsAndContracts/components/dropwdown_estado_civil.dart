// import 'package:bkopen/app/spacing/bkopen_spacing.dart';
// import 'package:bkopen/app/theme/bkopencolors.dart';
// import 'package:bkopen/app/theme/styles.dart';
// import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DropwdownEstadoCivil
//     extends GetView<LoanProposalController> {
//   const DropwdownEstadoCivil({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var wd = MediaQuery.of(context).size.width;
//     var ht = MediaQuery.of(context).size.height;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Estado civil", style: Styles.textAll.copyWith(color: BKOpenColors.primary)),
//         BKOpenSpacing.x8,
//         Obx(
//           () => Container(
//             width: Get.width * .90,
//             height: 40,
//             child: DropdownSearch<String>(
            
//               itemAsString: (item) => item,
             
//               onChanged: (value) {
//                 controller.estadoCivil.text = value!;
//                 controller.update();
//               },
//               selectedItem:'Informe seu estado civil',

//               popupProps: PopupProps.menu(
// itemBuilder: (context, item, isSelected) {
//   return Container(height: 40,
//     color:item == controller.estadoCivilList.value? BKOpenColors.secondary.withOpacity(.3): BKOpenColors.white, child:  Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(item , style: Styles.labelText.copyWith(color: item == controller.estadoCivilList.value? BKOpenColors.secondary : BKOpenColors.blackSub, ),),
//     ));
// },
//                   listViewProps: ListViewProps(
//                       keyboardDismissBehavior:
//                           ScrollViewKeyboardDismissBehavior.onDrag,
//                       padding: EdgeInsets.only(left: 20, bottom: 20),
//                       addSemanticIndexes: false),
//                   searchFieldProps: TextFieldProps(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                       decoration: InputDecoration(
//                           contentPadding: EdgeInsets.only(top: 10, left: 10),
//                           hintMaxLines: 2,
//                           hintText: "Buscar",
//                           border: OutlineInputBorder(),
//                           constraints:
//                               BoxConstraints.tight(Size(wd * .83, ht * .052)))),
//                   constraints: BoxConstraints.tight(Size(wd * .85, ht * .45)),
//                   menuProps: MenuProps(
                   
//                       clipBehavior: Clip.hardEdge,
//                       borderRadius: BorderRadius.all(Radius.circular(6))),
//                   fit: FlexFit.loose,
//                   showSearchBox: true),

//               dropdownButtonProps: DropdownButtonProps(
//                   icon: Icon(
//                 Icons.expand_more_outlined,
//                 color: BKOpenColors.primary,
//               )),
//               dropdownDecoratorProps: DropDownDecoratorProps(
//                 baseStyle: Styles.labelText,
//                 textAlignVertical: TextAlignVertical.top,
//                 textAlign: TextAlign.start,
//                 dropdownSearchDecoration: InputDecoration(
//                   constraints:
//                       BoxConstraints(maxHeight: ht * .45, minHeight: ht * .45),
//                   hoverColor: BKOpenColors.primary,
//                   contentPadding: EdgeInsets.only(left: 15, top: 15),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6.0),
//                     borderSide: BorderSide(
//                       color: BKOpenColors.borderGrey, // Cor do contorno cinza
//                       width: 1.0,
//                       // Largura do contorno
//                     ),
//                   ),
//                 ),
//               ),
//               onSaved: (newValue) {
//                 controller.estadoCivil.text = newValue!;
//               },
//               items: controller.estadoCivilList.value,
            
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
