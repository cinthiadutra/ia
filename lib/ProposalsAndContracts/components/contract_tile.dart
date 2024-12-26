// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:flutter/material.dart';

import 'package:bkopen/app/theme/styles.dart';
import 'package:intl/intl.dart';

class ContractTile extends StatelessWidget {
  final JornadaDTO model;
  final int index;
  const ContractTile({
    super.key,
    required this.model,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(model.ocorrencia ?? '');

    // Formatar a data no formato desejado
    String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: BKOpenColors.borderGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.viewclasseProduto ?? '',
                style: Styles.h4.copyWith(color: BKOpenColors.secondary)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Número do contrato', style: Styles.subTextDetails),
                Text(model.viewjornada ?? '', style: Styles.textDetailsValor),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Data:', style: Styles.subTextDetails),
                Text(
                    // String original no formato ISO 8601

                    // Parse a string para DateTime

                    formattedDate,
                    style: Styles.textDetailsValor),
              ],
            ),
            SizedBox(height: 16),
            BKOpenButton.card(
                height: 35,
                onTap: () {
                  // Ação do botão "Detalhes da Proposta"
                },
                imageRight: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
                text: 'Detalhes do Contrato'),
          ],
        ),
      ),
    );
  }
}
