// ignore_for_file: unrelated_type_equality_checks

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/enums/enum_status_proposta.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProposalTileProposta extends StatelessWidget {
  final JornadaDTO model;
  final int index;
  const ProposalTileProposta({
    super.key,
    required this.index,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProposalController>();
    

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
              Text(model.viewprodutoParceiroId ?? '',
                  style: Styles.buttonLabel.copyWith(fontSize: 16)),
              SizedBox(height: 8),
              _buildProposalStatus(BKOpenColors.facebookBlue,
                  model.viewjornada ?? ' Home Equity'),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Valor Total:', style: Styles.textDetails),
                  Text(model.valorPretendido ?? "0.0",
                      style: Styles.textDetailsBold
                          .copyWith(color: BKOpenColors.secondary)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Data da proposta:', style: Styles.textDetails),
                  Text(
                    DateFormat("dd/MM/yyyy").format(
                      model.ocorrencia != null
                          ? DateTime.parse(model.ocorrencia!)
                          : DateTime.now(),
                    ),
                    style: Styles.textDetailsBold
                        .copyWith(color: BKOpenColors.secondary),
                  ),
                ],
              ),
              SizedBox(height: 16),
              BKOpenButton.card(
                backgroundColor: model.viewjornada?[index] ==
                        StatusPropostaEnum.pendencia.nome
                    ? BKOpenColors.white
                    : BKOpenColors.primary,
                borderColor: BKOpenColors.primary,
                textColor: model.viewjornada?[index] ==
                        StatusPropostaEnum.pendencia.nome
                    ? BKOpenColors.primary
                    : BKOpenColors.white,
                onTap: () {
                  if (model.viewjornada?[index] ==
                      StatusPropostaEnum.pendencia.nome) {
                    Get.toNamed(PageRoutes.againstproposalorpendingdetailgpage);
                  } else if (model.viewjornada?[1] ==
                      StatusPropostaEnum.pendencia.nome) {
                    Get.toNamed(PageRoutes.againstproposalorpendingdetailgpage,
                        arguments: "pen");
                  } else {
                    controller.filterDetailPropostas(
                        jornadaId: model.id!,
                        jornada: model.jornada!,
                        index: index);
                  }
                },
                imageRight: Icon(
                  model.viewjornada?[index] == StatusPropostaEnum.pendencia.nome
                      ? Icons.sd_card_alert_outlined
                      : Icons.description_outlined,
                  color: model.viewjornada?[index] ==
                          StatusPropostaEnum.pendencia.nome
                      ? BKOpenColors.highlight
                      : BKOpenColors.white,
                ),
                text: model.viewjornada?[index] ==
                        StatusPropostaEnum.pendencia.nome
                    ? 'Resolver pendências'
                    : 'Detalhes da Proposta',
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProposalStatus(Color cor, String nome) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.only(right: 8),
      color: cor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            nome,
            style: Styles.labelText.copyWith(
                fontWeight: FontWeight.w700, color: BKOpenColors.white),
          ),
          SizedBox(
            width: 5,
          ),
          StatusPropostaEnum.restricao.name == 'Restrição' ||
                  StatusPropostaEnum.pendencia == 'Pendência'
              ? Icon(
                  Icons.info_outline_rounded,
                  size: 16,
                )
              : SizedBox()
        ],
      ),
    );
  }
}
