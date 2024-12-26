// ignore_for_file: file_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/auth/components/info_card_rose.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';

import '../../app/components/button/bkopen_button.dart';
import '../../app/spacing/bkopen_spacing.dart';
import '../../app/theme/styles.dart';

class LoanResumeProposalPage extends StatelessWidget {
  final controller = Get.find<LoanProposalController>();
  final NumberFormat formatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  LoanResumeProposalPage({
    super.key,
  });
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
                      Text("Valores informados", style: Styles.h4),
                      BKOpenSpacing.x8,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.detailSimulation?.data?.length,
                        itemBuilder: (context, index) {
                          var atributo =
                              controller.detailSimulation?.data?[index];
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
                      Divider(),
                      BKOpenSpacing.x4,
                      Text(
                        'Informações complementares',
                        style: Styles.textDetailsBold.copyWith(
                          color: BKOpenColors.secondary,
                        ),
                      ),
                      BKOpenSpacing.x16,
                      Text(
                        controller
                                .parceiroDto?.data?.first.informativoProdutos ??
                            '',
                        style: Styles.textDetailsTitle,
                      ),
                      BKOpenSpacing.x8,
                      Divider(),
                      BKOpenSpacing.x4,
                      InfoCardRose(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
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
                        controller.detailSimulation?.data?.first.jornadaId;
                    var id =
                        controller.detailSimulation?.data?.first.jornadaEtapaId;

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
                  onTap: () => controller.avancarEtapasBuscarProposta(),
                ),
                BKOpenSpacing.x16,
                BKOpenButton.outline(
                  onTap: () {
                    controller.gerarResumoJornada(
                        jornadaId: controller
                                .detailSimulation?.data?.first.jornadaId ??
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
      ),
    );
  }
}
