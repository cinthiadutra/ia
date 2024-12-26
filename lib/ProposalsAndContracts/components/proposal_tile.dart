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

class ProposalTile extends StatelessWidget {
  final JornadaDTO model;
  final int index;
  final ProposalController controller;
  const ProposalTile(
      {super.key,
      required this.index,
      required this.model,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    // NumberFormat formatter =
    //     NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: GestureDetector(
        onTap: () {},
        child: Visibility(
          visible: model.viewprodutoParceiroId == "" ? false : true,
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
                  backgroundColor: model.viewjornada == 'Interesse' ||
                          model.viewjornada == 'Desejo'
                      ? BKOpenColors.white
                      : BKOpenColors.primary,
                  borderColor: BKOpenColors.primary,
                  textColor: model.viewjornada == 'Interesse' ||
                          model.viewjornada == 'Desejo'
                      ? BKOpenColors.primary
                      : BKOpenColors.white,
                  onTap: () async {
                    if (model.viewjornada == 'Restricao') {
                      Get.toNamed(
                          PageRoutes.againstproposalorpendingdetailgpage,
                          arguments: "pen");
                    } else if (model.viewjornada == 'Simulacao' ||
                        model.viewjornada == 'Proposta') {
                      controller.jornadaId = model.id;

                      await controller.filterDetailPropostas(
                          jornada: model.jornada!,
                          index: index,
                          jornadaId: model.id!);
                    } else if (model.viewjornada == 'Negociacao') {
                      controller.filterDetailPropostasNegociacao(
                          jornadaId: model.id!,
                          jornada: model.jornada!,
                          index: index);
                    } else if (model.viewjornada == 'Interesse' ||
                        model.viewjornada == 'Desejo') {
                      controller.filterJornadaEtapa(jornadaId: model.id!, jornada: model.jornada!);
                    }
                  },
                  imageRight: Icon(
                    model.viewjornada == StatusPropostaEnum.pendencia.nome
                        ? Icons.sd_card_alert_outlined
                        : Icons.description_outlined,
                    color:
                        model.viewjornada == StatusPropostaEnum.pendencia.nome
                            ? BKOpenColors.highlight
                            : model.viewjornada == "Interesse" ||
                                    model.viewjornada == "Desejo"
                                ? BKOpenColors.white
                                : BKOpenColors.primary,
                  ),
                  text: model.viewjornada == "Restricao"
                      ? 'Resolver pendências'
                      : model.viewjornada == "Interesse" ||
                              model.viewjornada == "Desejo"
                          ? "Continuar Proposta"
                          : 'Detalhes da Proposta',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProposalStatus(Color cor, String nome) {
    return Container(
      height: 25,
      width: 90,
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: nome == StatusPropostaEnum.pendencia.nome
              ? StatusPropostaEnum.pendencia.cor
              : nome == StatusPropostaEnum.simulacao.nome
                  ? StatusPropostaEnum.simulacao.cor
                  : nome == StatusPropostaEnum.desejo.nome
                      ? StatusPropostaEnum.desejo.cor
                      : nome == StatusPropostaEnum.interesse.nome
                          ? StatusPropostaEnum.interesse.cor
                          : nome == StatusPropostaEnum.proposta.nome
                              ? StatusPropostaEnum.proposta.cor
                              : nome == StatusPropostaEnum.restricao.nome
                                  ? StatusPropostaEnum.restricao.cor
                                  : nome == StatusPropostaEnum.negociacao.nome
                                      ? StatusPropostaEnum.negociacao.cor
                                      : BKOpenColors.checkBoxColor),
      child: Row(
        children: [
          Text(
            nome,
            style: Styles.labelSubtitlePopUp.copyWith(
                fontWeight: FontWeight.w700, color: BKOpenColors.white),
          ),
          SizedBox(
            width: 5,
          ),
          StatusPropostaEnum.restricao.name == 'Em Analise' ||
                  StatusPropostaEnum.pendencia.name == 'Em formalização'
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
