import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../app/components/button/bkopen_button.dart';
import '../../app/spacing/bkopen_spacing.dart';
import '../../app/theme/bkopencolors.dart';
import '../../app/theme/styles.dart';
import '../../auth/components/info_card_rose.dart';
import '../../app/widgets/appbar/bkappbar.dart';
import '../controllers/home_controller.dart';

final homeController = Get.find<HomeController>();
final proposalcontroller = Get.find<ProposalController>();

class DetailLastProposalPage extends StatelessWidget {
  const DetailLastProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Empréstimos"),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Obx(() => Text(
                    homeController.listProsposta.value.first.view.toString(),
                    style: Styles.h3Titulo,
                  )),
              BKOpenSpacing.x16,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Valores informados", style: Styles.h4),
                      BKOpenSpacing.x8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Etapa:'),
                          Text(
                              homeController
                                      .jornadaEtapaHome?.data?.first.viewjornada
                                      .toString() ??
                                  '',
                              style: Styles.textDetailsBold.copyWith(
                                color: BKOpenColors.secondary,
                              )),
                        ],
                      ),
                      BKOpenSpacing.x8,
                      _buildContent(),
                      BKOpenSpacing.x4,
                      const Divider(),
                      BKOpenSpacing.x4,
                      Visibility(
                        visible: homeController.jornadaEtapaHome?.data?.first
                                    .viewjornada ==
                                "Simulacao" ||
                            homeController.jornadaEtapaHome?.data?.first
                                    .viewjornada ==
                                "Proposta",
                        child: Text(
                          'Informações complementares',
                          style: Styles.textDetailsBold.copyWith(
                            color: BKOpenColors.secondary,
                          ),
                        ),
                      ),
                      BKOpenSpacing.x16,
                      Obx(() => Visibility(
                          visible: homeController.jornadaEtapaHome?.data?.first
                                      .viewjornada ==
                                  "Simulacao" ||
                              homeController.jornadaEtapaHome?.data?.first
                                      .viewjornada ==
                                  "Proposta",
                          child: homeController.isLoading.value
                              ? CircularProgressIndicator()
                              : homeController.parceiroDto?.data == [] ||
                                      homeController.parceiroDto?.data == null
                                  ? Text('Sem Informações Complementares')
                                  : Text(
                                      homeController.parceiroDto?.data?.first
                                              .informativoProdutos ??
                                          '',
                                      style: Styles.textDetailsTitle,
                                    ))),
                      BKOpenSpacing.x8,
                      const Divider(),
                      BKOpenSpacing.x4,
                      Visibility(
                          visible: homeController.jornadaEtapaHome?.data?.first
                                      .viewjornada ==
                                  "Simulacao" ||
                              homeController.jornadaEtapaHome?.data?.first
                                      .viewjornada ==
                                  "Proposta",
                          child: const InfoCardRose()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildContent() {
    if (homeController.jornadaEtapaHome?.data?.first.viewjornada ==
            "Simulacao" ||
        homeController.jornadaEtapaHome?.data?.first.viewjornada ==
            "Proposta") {
      return FutureBuilder(
        future: homeController.simulacaodetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = homeController.detailSimulation?.data ?? [];
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              var atributo = data[index];
              return _buildRow(
                atributo.viewatributoProdutoId?.capitalize ?? '',
                atributo.viewvalor ?? '0,00',
                atributo.viewtipoAtributo == 'Dinheiro'
                    ? BKOpenColors.secondary
                    : BKOpenColors.primary,
              );
            },
          );
        },
      );
    } else {
      return Obx(() => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.listProsposta.value.length,
            itemBuilder: (context, index) {
              var atributo = homeController.listProsposta.value[index];
              DateTime parsedDate =
                  DateTime.parse(atributo.created ?? DateTime.now().toString());
              var formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);

              return Column(
                children: [
                  _buildRow(
                    atributo.viewclasseProdutoId?.capitalize ?? '',
                    atributo.valorPretendido ?? '',
                    BKOpenColors.secondary,
                    extra: formattedDate,
                  ),
                ],
              );
            },
          ));
    }
  }

  Widget _buildRow(String title, String value, Color color, {String? extra}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.textDetailsTitle),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textDetailsBold.copyWith(color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final etapa = homeController.jornadaEtapaHome?.data?.first.viewjornada;
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              etapa == "Desejo" || etapa == "Interesse"
                  ? BKOpenButton(
                      backgroundColor: Colors.white,
                      text: "Continuar proposta",
                      imageRight: SvgPicture.asset(
                        "assets/images/svg/approval_delegation.svg",
                        color: BKOpenColors.white,
                      ),
                      textColor: BKOpenColors.primary,
                      onTap: () {
                        proposalcontroller.filterJornadaEtapa(
                          jornadaId:
                              homeController.listProsposta.value.first.id!,
                              jornada: homeController.jornadaEtapaHome?.data?.first.jornada??0
                        );
                      })
                  : etapa == "Simulacao"
                      ? BKOpenButton(
                          text: "Realizar proposta",
                          imageRight: SvgPicture.asset(
                            "assets/images/svg/approval_delegation.svg",
                            color: BKOpenColors.white,
                          ),
                          onTap: () =>
                              homeController.avancarEtapasBuscarProposta(),
                        )
                      : BKOpenButton(
                          text: "ver proposta",
                          imageRight: SvgPicture.asset(
                            "assets/images/svg/approval_delegation.svg",
                            color: BKOpenColors.white,
                          ),
                          onTap: () => homeController.proposalController
                                  .filterDetailPropostasNegociacao(
                                jornadaId: homeController
                                    .listProsposta.value.first.id!,
                                jornada: homeController
                                    .listProsposta.value.first.jornada!,
                                index: 0,
                              )),
              BKOpenSpacing.x16,
              BKOpenButton.outline(
                onTap: () {
                  homeController.gerarResumoJornada(
                      jornadaId: homeController
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
        ));
  }
}
