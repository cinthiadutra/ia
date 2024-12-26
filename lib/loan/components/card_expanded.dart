import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/loan/components/payment_details_widget.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardExpanded extends GetView<LoanProposalController> {
  final String title;

  CardExpanded(this.title, {super.key});
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
                title,
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
              init: null,
              builder: (offersController) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.listPropostasSimuladas?.data?.length,
                  itemBuilder: (context, index) {
                    var proposta =
                        controller.listPropostasSimuladas?.data?[index];

                    if (proposta?.valoresSaida == null) {
                      return SizedBox.shrink();
                    }

                    return PaymentDetailsWidget(
                      model: proposta!,
                      ontap: () async {
                        controller.jornadaSeelected = proposta;
                        debugPrint(
                            'Proposta selecionada: ${controller.jornadaSeelected.jornadaEtapaDesId}');
                        await controller.filterForParceiro(
                            agenteParceiroId: proposta.agenteParceiroId!);
                        if (proposta.jornadaEtapaDesId ==
                            controller.jornadaSeelected.jornadaEtapaDesId) {
                          // Após a execução do filtro
                          debugPrint(
                              'Proposta após filterForParceiro: ${controller.jornadaSeelected.jornadaEtapaDesId}');
                        }
                      },
                    );
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
