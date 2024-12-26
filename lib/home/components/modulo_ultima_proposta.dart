// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/routes/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:bkopen/app/components/loading/bkopen_loading.dart';
import 'package:bkopen/home/controllers/home_controller.dart';

import '../../app/theme/bkopencolors.dart';
import '../../app/theme/styles.dart';

class ModuloUltimaProposta extends StatefulWidget {
  const ModuloUltimaProposta({
    super.key,
  });

  @override
  _ModuloUltimaPropostaState createState() => _ModuloUltimaPropostaState();
}

class _ModuloUltimaPropostaState extends State<ModuloUltimaProposta> {
  Rx<bool> valueVisible = Rx<bool>(false);
  var controller = Get.find<HomeController>();
  String formattedDate = '';
  void toggleVisibility() {
    setState(() {
      valueVisible.value = !valueVisible.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(
        controller.listProsposta.value.first.ocorrencia ??
            DateTime.now().toString());
    formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);
    return Center(child: Obx(() {
      if (controller.isLoading.value) {
        return BKOpenLoading();
      }
      return Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Última proposta',
                      style: Styles.textForm
                          .copyWith(color: BKOpenColors.greyTitleTab),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () => toggleVisibility(),
                      child: Icon(
                        valueVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: BKOpenColors.highlight,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  controller.listProsposta.value.first.viewclasseProdutoId ??
                      '',
                  style: Styles.h4.copyWith(color: BKOpenColors.greyTitle),
                ),
                SizedBox(
                  height: 12,
                ),
                InkWell(
                  onTap: () {
                    if (controller.listProsposta.value.first.viewjornada ==
                        "Desejo") {
                      Get.toNamed(PageRoutes.detailslastloanpage);
                    } else {
                      controller.filterForParceiro(
                          agenteParceiroId: controller.agenteParceiroId.value);
                      Get.toNamed(PageRoutes.detailslastloanpage);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    decoration: BoxDecoration(
                      color: BKOpenColors.secondary,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Mais Detalhes',
                          style: Styles.textDetails
                              .copyWith(color: BKOpenColors.white01),
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 14,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: controller.listProsposta.value.first.viewjornada ==
                            'Desejo'
                        ? BKOpenColors.accentRed
                        : BKOpenColors.statusGreen,
                    border: Border.all(
                        color:
                            controller.listProsposta.value.first.viewjornada ==
                                    'Desejo'
                                ? BKOpenColors.accentRed
                                : controller.listProsposta.value.first
                                            .viewjornada ==
                                        "Simulacao"
                                    ? BKOpenColors.statusSimulacao
                                    : controller.listProsposta.value.first
                                                .viewjornada ==
                                            "Proposta"
                                        ? BKOpenColors.status374
                                        : BKOpenColors.status349),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    controller.listProsposta.value.first.viewjornada ?? '',
                    style: Styles.labelStatusText,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: !valueVisible.value,
                      child: Row(
                        children: [
                          Text('Valor: R\$ ', style: Styles.labelText),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: BKOpenColors.primary,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: BKOpenColors.primary,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: BKOpenColors.primary,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: BKOpenColors.primary,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: valueVisible.value,
                      child: Text(
                          'Valor: R\$ ${controller.listProsposta.value.first.valorPretendido}',
                          style: Styles.subText),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Data: $formattedDate',
                  style: Styles.subText,
                ),
              ],
            )
          ],
        ),
      );
    }));
  }
}
