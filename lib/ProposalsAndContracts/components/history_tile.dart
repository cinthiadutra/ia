import 'package:bkopen/ProposalsAndContracts/views/proposal_against/against_proposal_or_pending__detail_page.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryTile extends StatelessWidget {
  final JornadaDTO models;

  final int index;

  const HistoryTile({super.key, required this.index, required this.models});

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(models.ocorrencia ?? '');

    // Formatar a data no formato desejado
    String formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: BKOpenColors.borderGrey),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(models.viewclasseProdutoId ?? '',
                      style: Styles.h4.copyWith(color: BKOpenColors.secondary)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Data da proposta:', style: Styles.subTextDetails),
                      Text(formattedDate ?? '', style: Styles.textDetailsValor),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              BKOpenButton.card(
                onTap: () {
                  // if (index == 0) {
                  //   Get.toNamed(PageRoutes.againstproposalorpendingdetailgpage,
                  //       arguments: "pendency");
                  // } else if (index == 1) {
                  //   Get.toNamed(PageRoutes.againstproposalorpendingdetailgpage,
                  //       arguments: "pen");
                  // }
                  Get.to(AgainstProposalOrPendingDetailPage(
                    model: models,
                    index: index,
                  ));
                },
                imageRight: Icon(
                  Icons.description_outlined,
                  color: BKOpenColors.white,
                ),
                text: 'Detalhes da Proposta',
              )
            ],
          ),
        ),
      ),
    );
  }
}
