import 'dart:developer';

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/auth/components/info_card_rose.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsProposalPage extends StatefulWidget {
  const DetailsProposalPage({super.key});

  @override
  State<DetailsProposalPage> createState() => _DetailsProposalPageState();
}

final controller = Get.find<ProposalController>();
final loanController = Get.find<LoanProposalController>();

class _DetailsProposalPageState extends State<DetailsProposalPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Empréstimos"),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Título de valores informados
                      Text("Valores informados", style: Styles.h4),
                      BKOpenSpacing.x8,
                      // Lista de valores informados
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.detailSimulationOut?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          var atributo =
                              controller.detailSimulationOut?.data?[index];
                          if (atributo?.valor == null) {
                            return const SizedBox.shrink();
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  atributo?.viewatributoProdutoId?.capitalize ??
                                      '',
                                  style: Styles.textDetailsTitle,
                                ),
                                atributo?.viewtipoAtributo == 'Dinheiro'
                                    ? Text(
                                        atributo?.viewvalor ?? '0,00',
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.textDetailsBold.copyWith(
                                          color: BKOpenColors.secondary,
                                        ),
                                      )
                                    : atributo?.viewtipoAtributo == 'Boolean'
                                        ? Text(
                                            atributo?.viewvalor ?? '0,00',
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                Styles.textDetailsBold.copyWith(
                                              color: BKOpenColors.secondary,
                                            ),
                                          )
                                        : Text(
                                            atributo?.viewvalor ?? '0,00',
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                Styles.textDetailsBold.copyWith(
                                              color: BKOpenColors.secondary,
                                            ),
                                          ),
                              ],
                            ),
                          );
                        },
                      ),
                      BKOpenSpacing.x4,
                      const Divider(),
                      BKOpenSpacing.x4,

                      // Informações complementares
                      Text(
                        'Informações complementares',
                        style: Styles.textDetailsBold.copyWith(
                          color: BKOpenColors.secondary,
                        ),
                      ),
                      BKOpenSpacing.x16,
                      controller.parceiroDto?.data == null ||
                              controller.parceiroDto?.data == []
                          ? SizedBox.shrink()
                          : Text(
                              controller.parceiroDto?.data?.first
                                      .informativoProdutos ??
                                  '',
                              style: Styles.textDetailsTitle,
                            ),
                      BKOpenSpacing.x8,
                      const Divider(),
                      BKOpenSpacing.x4,
                      const InfoCardRose(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BKOpenButton(
                backgroundColor: BKOpenColors.highlight,
                borderColor: BKOpenColors.highlight,
                text: "Conclua sua Proposta na WEB",
                imageRight: SvgPicture.asset(
                  "assets/images/svg/captive_portal.svg",
                  color: BKOpenColors.white,
                ),
                onTap: () async {
                  var jornadaId =
                      controller.detailSimulationOut?.data?.first.jornadaId;
                  var id = controller
                      .detailSimulationOut?.data?.first.jornadaEtapaId;

                  if (jornadaId != null && id != null) {
                    var url = Uri.parse(
                        'http://manager.hmg.bkopen.com/pt/login?returnUrl=jornada/novaproposta?continue=true&jornadaId=$jornadaId&ids=$id');
                    log(url.toString());
                    await launchUrl(
                      url,
                      mode: LaunchMode.inAppBrowserView,
                      browserConfiguration:
                          const BrowserConfiguration(showTitle: true),
                    );
                  } else {
                    log('Jornada ID ou ID inválido.');
                  }
                },
              ),
              BKOpenSpacing.x16,
              BKOpenButton(
                text: "Realizar proposta",
                imageRight: SvgPicture.asset(
                  "assets/images/svg/approval_delegation.svg",
                  color: BKOpenColors.white,
                ),
                onTap: () {
                  var jornadaId =
                      controller.detailSimulationOut?.data?.first.jornadaId;
                      var jornada=
                      controller.propostasEnviadas.value.jornada;
                  controller.filterJornadaEtapaBuscarProposta(ids: jornadaId!, jornada: jornada!);
                },
              ),
              BKOpenSpacing.x16,
              BKOpenButton.outline(
                onTap: () {
                  controller.gerarResumoJornada(
                      jornadaId: controller
                              .detailSimulationOut?.data?.first.jornadaId ??
                          0);
                },
                text: "Gerar PDF detalhado",
                textColor: BKOpenColors.primary,
                widthBorder: 2,
                backgroundColor: BKOpenColors.white,
                borderColor: BKOpenColors.primary,
                imageRight: SvgPicture.asset(
                  "assets/images/svg/article_shortcut.svg",
                  color: BKOpenColors.highlight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
