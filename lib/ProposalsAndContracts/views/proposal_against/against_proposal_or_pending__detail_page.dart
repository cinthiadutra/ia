// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';

import '../../../app/components/button/bkopen_button.dart';
import '../../../app/routes/AppPages.dart';
import '../../../app/spacing/bkopen_spacing.dart';
import '../../../app/theme/styles.dart';

class AgainstProposalOrPendingDetailPage extends GetView<ProposalController> {
  JornadaDTO? model;
  int index;
  AgainstProposalOrPendingDetailPage({
    super.key,
    this.model,
    this.index = 0,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BKAppBar(
        label: model?.viewclasseProdutoId ?? "",
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
            child: Column(children: [
          Column(
            children: [
              BKOpenSpacing.x16,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pendências | Proposta 8712H-UAYV9",
                    style: Styles.h3Strong,
                  ),
                ],
              ),
              BKOpenSpacing.x24,
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: BKOpenColors.borderGreyLight, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Informação pendente', style: Styles.labelText),
                      BKOpenSpacing.x4,
                      Text('RG Frente',
                          style: Styles.textDetailsBold
                              .copyWith(color: BKOpenColors.highlight)),
                      BKOpenSpacing.x16,
                      Text('Valor Atual', style: Styles.labelText),
                      BKOpenSpacing.x4,
                      Text('Valor do campo/arquivo',
                          style: Styles.textDetailsBold
                              .copyWith(color: BKOpenColors.primary)),
                      BKOpenSpacing.x16,
                      Text('Explicação:', style: Styles.labelText),
                      BKOpenSpacing.x16,
                      Text(
                          'Para continuar o processo de contratação da proposta 8712H-UAYV9 com o Banco do Brasil é necessário verificarmos sua identidade. ',
                          style: Styles.labelText
                              .copyWith(color: BKOpenColors.blackSub)),
                      BKOpenSpacing.x16,
                      Divider(
                        color: BKOpenColors.primary,
                      ),
                      Text('Informação pendente', style: Styles.labelText),
                      BKOpenSpacing.x4,
                      Text('RG Verso',
                          style: Styles.textDetailsBold
                              .copyWith(color: BKOpenColors.highlight)),
                      BKOpenSpacing.x16,
                      Text('Valor Atual', style: Styles.labelText),
                      BKOpenSpacing.x4,
                      Text('Valor do campo/arquivo',
                          style: Styles.textDetailsBold
                              .copyWith(color: BKOpenColors.primary)),
                      BKOpenSpacing.x16,
                      Text('Explicação:', style: Styles.labelText),
                      BKOpenSpacing.x16,
                      Text(
                          'Para continuar o processo de contratação da proposta 8712H-UAYV9 com o Banco do Brasil é necessário verificarmos sua identidade. ',
                          style: Styles.labelText
                              .copyWith(color: BKOpenColors.blackSub)),
                      BKOpenSpacing.x16,
                      Divider(
                        color: BKOpenColors.primary,
                      ),
                      Text('Informação pendente', style: Styles.labelText),
                      BKOpenSpacing.x4,
                      Text('Data de emissão',
                          style: Styles.textDetailsBold
                              .copyWith(color: BKOpenColors.highlight)),
                      BKOpenSpacing.x16,
                      Text('Valor Atual', style: Styles.labelText),
                      BKOpenSpacing.x4,
                      Text('Valor do campo/arquivo',
                          style: Styles.textDetailsBold
                              .copyWith(color: BKOpenColors.primary)),
                      BKOpenSpacing.x16,
                      Text('Explicação:', style: Styles.labelText),
                      BKOpenSpacing.x16,
                      Text(
                          'Para continuar o processo de contratação da proposta 8712H-UAYV9 com o Banco do Brasil é necessário verificarmos sua identidade. ',
                          style: Styles.labelText
                              .copyWith(color: BKOpenColors.blackSub)),
                      BKOpenSpacing.x16,
                      Divider(
                        color: BKOpenColors.primary,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ])),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 20, right: 20),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            BKOpenButton(
              text: "Resolver pendências",
              imageRight:
                  Icon(Icons.note_alt_outlined, color: Colors.white, size: 16),
              onTap: () {
                Get.toNamed(PageRoutes.proposalagainstatualizationoptionspage);
              },
            ),
            BKOpenSpacing.x16,
            BKOpenButton.outline(
              onTap: () =>
                  Get.toNamed(PageRoutes.proposalagainstatualizationchatpage),
              backgroundColor: BKOpenColors.white,
              textColor: BKOpenColors.primary,
              borderColor: BKOpenColors.primary,
              text: "Entrar em Contato",
              imageRight: Icon(
                Icons.chat_bubble_outline_rounded,
                size: 18,
                color: BKOpenColors.highlight,
              ),
            ),
            BKOpenSpacing.x16,
          ],
        ),
      ),
    );
  }
}
