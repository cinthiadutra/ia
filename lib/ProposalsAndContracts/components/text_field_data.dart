import 'package:bkopen/app/components/utils/formatter_class.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldData extends GetView<ProposalController> {
  final String texto;
  final TextEditingController controllerEC;

  const TextFieldData(
      {required this.texto, required this.controllerEC, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        onChanged: (value) {
          controllerEC.text = value;
          controller.dateC.text = value;
        },
        controller: controllerEC,
        decoration: InputDecoration(
          labelText: texto,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: BKOpenColors.borderGrey)),
          labelStyle: Styles.textDetails.copyWith(fontSize: 14),
          suffixIcon: InkWell(
            onTap: () => controller.displayDatePicker(context),
            child: const Icon(
              Icons.calendar_month_outlined,
              color: BKOpenColors.primary,
              size: 20,
            ),
          ),
        ),
        keyboardType: TextInputType.datetime,
        inputFormatters: [DateInputFormatter()],
      ),
    );
  }
}
