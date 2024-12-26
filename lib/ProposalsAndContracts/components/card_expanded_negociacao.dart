import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/loan/components/payment_details_widget.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardExpandedProposal extends StatefulWidget {
  final String title;

  CardExpandedProposal(this.title, {super.key});

  @override
  State<CardExpandedProposal> createState() => _CardExpandedProposalState();
}

final controller = Get.find<ProposalController>();

class _CardExpandedProposalState extends State<CardExpandedProposal> {
  final wt = Get.width;

  final ht = Get.height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: BKOpenColors.borderGreyLight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: Styles.buttonLabel.copyWith(
                  color: controller.isExpanded.value
                      ? BKOpenColors.primary
                      : BKOpenColors.primary.withOpacity(.5),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.isExpanded.value = !controller.isExpanded.value;
                },
                icon: Icon(controller.isExpanded.value
                    ? Icons.expand_less
                    : Icons.expand_more),
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: controller.isExpanded.value ? null : 0,
            child: GetBuilder<LoanProposalController>(
              builder: (controllers) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.listaPropostasEmNegociacao.value.length,
                  itemBuilder: (context, index) {
                    var proposta =
                        controller.listaPropostasEmNegociacao.value[index];

                    return  PaymentDetailsWidget(
                        model: proposta,
                        ontap: () async {
                          controller.jornadaSeelectedNego = proposta;

                          await controller.filterForParceiro(
                              agenteParceiroId: proposta.agenteParceiroId!, produtoParceiroId: proposta.produtoParceiroId!);
                        });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
