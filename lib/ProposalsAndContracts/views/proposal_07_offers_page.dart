// ignore_for_file: deprecated_member_use

import 'package:bkopen/ProposalsAndContracts/components/card_expanded_negociacao.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/loan/components/card_expanded.dart';
import 'package:bkopen/loan/components/head_proposal.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../app/components/button/bkopen_button.dart';
import '../../app/spacing/bkopen_spacing.dart';

class ProposalOffersPage extends StatefulWidget {
  const ProposalOffersPage({super.key});

  @override
  State<ProposalOffersPage> createState() => _ProposalOffersPageState();
}

class _ProposalOffersPageState extends State<ProposalOffersPage> {
  final controller = Get.find<LoanProposalController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(
          label: 'Emprestimos',
          estaNahome: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              HeadProposal(),
              BKOpenSpacing.x24,
              CardExpandedProposal('Propostas'),
              BKOpenSpacing.x24,
              // CardExpandedOther('Outras Ofertas'),
              // BKOpenSpacing.x24,
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BKOpenButton(
                imagePadding: 5,
                text: "Simular Jornada Novamente",
                textColor: BKOpenColors.white,
                backgroundColor: BKOpenColors.highlight,
                borderColor: BKOpenColors.highlight,
                imageRight: SvgPicture.asset(
                  "assets/images/svg/article_shortcut.svg",
                  color: BKOpenColors.highlight,
                ),
                onTap: () {
                  controller.simularJornada();
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: BKOpenButton.outline(
                    imagePadding: 5,
                    widthBorder: 2,
                    text: "Gerar resumo das propostas",
                    textColor: BKOpenColors.primary,
                    backgroundColor: BKOpenColors.white,
                    borderColor: BKOpenColors.primary,
                    imageRight: SvgPicture.asset(
                      "assets/images/svg/article_shortcut.svg",
                      color: BKOpenColors.highlight,
                    ),
                    onTap: () {
                      controller.gerarResumoJornada(
                          jornadaId: controller.jornadaId!);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
