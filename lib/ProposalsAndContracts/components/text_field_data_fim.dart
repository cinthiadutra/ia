import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

class TextFieldDataFim extends GetView<ProposalController> {
  final String texto; 
final TextEditingController controllerECF;


  const TextFieldDataFim({required this.texto,  required this.controllerECF, super.key });


   @override
   Widget build(BuildContext context) {
       return                                         SizedBox(
                   height: 40,
                   child: TextFormField(
                     controller: controllerECF,
                     decoration:  InputDecoration(
                       labelText: texto,
                       border: OutlineInputBorder(
                        borderSide: BorderSide(color: BKOpenColors.borderGrey)
                       ),
                       labelStyle: Styles.textDetails.copyWith(fontSize: 14),
                       suffixIcon: InkWell(
                   onTap: () => controller.displayDatePickerFim(context),
                   child: const Icon(
                     Icons.calendar_month_outlined,
                     color: BKOpenColors.primary,
                     size: 20,
                   ),
                 ),
                     ),
                     keyboardType: TextInputType.datetime,
                     onChanged: (value) {
                       controllerECF.text = value;
                       controller.dateF.text = value;
                     },
                     validator: Validatorless.date('Data inválida'),
                     inputFormatters: [
                       MaskTextInputFormatter(mask: '##/##/####')

                     ],
                   ),
                 );
  }
}