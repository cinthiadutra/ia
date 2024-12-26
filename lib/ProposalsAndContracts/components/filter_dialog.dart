// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/ProposalsAndContracts/components/text_field_data.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  bool menorTaxaSelected = false;
  bool maiorParcelasSelected = false;
  bool menorParcelasSelected = false;
  TextEditingController dataIni = TextEditingController();
  TextEditingController dataFim = TextEditingController();
  // final controller = Get.find<LoanOffersController>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0), 
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Filtros',
                      style: Styles.buttonLabel,
                    ),
                    Icon(
                      Icons.filter_alt_outlined,
                      size: 18,
                      color: BKOpenColors.secondary,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Filtrar por:',
              style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter'),
            ),
            SizedBox(height: 8.0),
            Wrap(
              runSpacing: 4.0,
              children: [
                FilterOption(
                  text: 'Menor taxa de juros',
                  selected: menorTaxaSelected,
                  onTap: () {
                    setState(() {
                      menorTaxaSelected = !menorTaxaSelected;
                    });
                  },
                ),
                FilterOption(
                  text: 'Maior número de parcelas',
                  selected: maiorParcelasSelected,
                  onTap: () {
                    setState(() {
                      maiorParcelasSelected = !maiorParcelasSelected;
                    });
                  },
                ),
                FilterOption(
                  text: 'Menor número de parcelas',
                  selected: menorParcelasSelected,
                  onTap: () {
                    setState(() {
                      menorParcelasSelected = !menorParcelasSelected;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Data da primeira parcela',
              style: Styles.textForm,
            ),
            SizedBox(height: 6.0),
            TextFieldData(
              texto: 'De',
              controllerEC: dataIni,
            ),
            SizedBox(height: 8.0),
            TextFieldData(
              texto: 'Até',
              controllerEC: dataFim,
            ),
            SizedBox(height: 16.0),
            BKOpenButton(
              text: 'Filtrar propostas',
              backgroundColor: BKOpenColors.secondary,
              onTap: () {
                // Lógica para aplicar os filtros
                // menorParcelasSelected
                //     ? controller.filterByParcelas()
                //     : menorTaxaSelected
                //         ? controller.filterByInterestRate(true)
                //         : controller.filterByParcelas(menor: false);
              },
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const FilterOption(
      {super.key, required this.text, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          border: Border.all(color: BKOpenColors.secondary),
          color: selected ? BKOpenColors.secondary : Colors.white,
        ),
        child: Center(
          child: Text(
            maxLines: 1,
            text,
            style: Styles.textDetails.copyWith(
                color: selected ? BKOpenColors.white : BKOpenColors.secondary),
          ),
        ),
      ),
    );
  }
}