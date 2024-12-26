// import 'package:bkopen/app/spacing/bkopen_spacing.dart';
// import 'package:bkopen/app/theme/styles.dart';
// import 'package:bkopen/loan/data/models/options_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DropdownCustomDynamicFormFieldBool extends FormField<OptionsList> {
//   DropdownCustomDynamicFormFieldBool({
//     super.key,
//     required RxList<OptionsList> list,
//     required String title,
//     required String Function(OptionsList) getLabel,
//     Function(OptionsList)? onSelected,
//     super.validator,
//     OptionsList? value,
//     bool autovalidateMode = false,
//   }) : super(
//           builder: (FormFieldState<OptionsList> state) {
//             // Garantir que a lista seja única removendo duplicatas com base no  // Garantir que a lista seja única removendo duplicatas com base no ID
//             final uniqueList = list
//                 .toSet() // Remove duplicatas com base no ID
//                 .toList()
//               ..sort((a, b) => a.id!.compareTo(b.id!));

//             // Verificar se o valor inicial está na lista
//             final initialValue = state.value ?? value;
//             final isValidValue =
//                 uniqueList.any((option) => option.id == initialValue?.id);
//             bool showError = false;
//                 uniqueList.any((option) => option.id == initialValue?.id);

//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: Styles.textForm,
//                 ),
//                 BKOpenSpacing.x8,
//                 InputDecorator(
//                   baseStyle: Styles.textInput,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(6.0)),
//                     ),
//                     contentPadding: EdgeInsets.only(left: 5),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<OptionsList>(
//                       isExpanded: true,
//                       // Usar o placeholder caso o valor inicial não seja válido
//                       value: isValidValue ? initialValue : placeholderOption,
//                       items: dropdownList.map((option) {
//                         return DropdownMenuItem<OptionsList>(
//                           value: option,
//                           child: Text(getLabel(option)),
//                         );
//                       }).toList(),
//                       onChanged: (OptionsList? selected) {
//                         if (selected != placeholderOption) {
//                           state.didChange(selected);
//                           if (onSelected != null && selected != null) {
//                             onSelected(selected);
//                           }
//                         } else {
//                           state.didChange(null);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 if (state.hasError)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8.0),
//                     child: Text(
//                       state.errorText ?? '',
//                       style: TextStyle(color: Colors.red, fontSize: 12),
//                     ),
//                   ),
//               ],
//             );
//           },
//         );
// }
