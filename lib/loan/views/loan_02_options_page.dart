// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar_jornada.dart';
import 'package:bkopen/loan/components/card_item.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/styles.dart';

class LoanOptionsPage extends StatefulWidget {
  const LoanOptionsPage({super.key});

  @override
  State<LoanOptionsPage> createState() => _LoanOptionsPageState();
}

class _LoanOptionsPageState extends State<LoanOptionsPage> {
  var controller = Get.find<LoanProposalController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBarJornada(
          label: "Empréstimos",
          isEtapaDesejo: true,
          rota: () {},
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              BKOpenSpacing.x24,
              Center(
                child: Text(
                  "Selecione o produto de seu interesse",
                  style: Styles.h4,
                ),
              ),
              BKOpenSpacing.x16,
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.listProduct.value.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Obx(() => Visibility(
                          visible: !controller
                              .listProduct.value[i].restritoNessaJornada!,
                          child: CardItem(
                            isSelected: controller.selectedIndexCard.value == i,
                            text: controller.listProduct.value[i].nome ?? '',
                            onTap: () {
                              controller.selectedIndexCard.value = i;
                              controller.produtoParceiroId.value =
                                  controller.listProduct.value[i].id!;
                            },
                          ),
                        ));
                  })
            ]),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: BKOpenButton(
              text: "Tenho interesse",
              imageRight: Icon(
                Icons.navigate_next,
                color: Colors.white,
              ),
              imagePadding: 10,
              onTap: () {
                controller.avancarEtapas();
              },
            ),
          ),
        ),
      ),
    );
  }
}
