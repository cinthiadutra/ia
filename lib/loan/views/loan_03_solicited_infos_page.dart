// ignore_for_file: avoid_types_as_parameter_names

import 'dart:async';

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar_jornada.dart';
import 'package:bkopen/loan/components/build_atributte_view.dart';
import 'package:bkopen/loan/components/build_old_atributes.dart';
import 'package:bkopen/loan/components/etapa_widget.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/styles.dart';

class LoanSolicitedInfosPage extends StatefulWidget {
  const LoanSolicitedInfosPage({super.key});

  @override
  State<LoanSolicitedInfosPage> createState() => _LoanSolicitedInfosPageState();
}

class _LoanSolicitedInfosPageState extends State<LoanSolicitedInfosPage> {
  final controller = Get.find<LoanProposalController>();
  Timer? _debounce;
  final _formKey = GlobalKey<FormState>();

  // Função para validar se todos os campos estão preenchidos

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBarJornada(
          label: '',
          isEtapaDesejo: false,
          rota: () {
            controller.salvarAtributosDinamicosaoCancelar();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Informações necessárias",
                    style: Styles.h3Strong,
                  ),
                  BKOpenSpacing.x16,
                  EtapaWidget(
                    page: controller.atributosDados.value.sections?.first.order
                            .toString() ??
                        '',
                    label: controller.atributosDados.value.sections?.first
                            .section?.nome?.capitalize ??
                        '',
                  ),
                  GetBuilder<LoanProposalController>(
                    init: controller,
                    builder: (_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BKOpenSpacing.x16,
                          Text(
                            "Precisamos de algumas informações para personalizar mais ofertas para você",
                            style: Styles.bodyText,
                          ),
                          BKOpenSpacing.x24,
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.atributosDados.value.sections
                                ?.first.attributes?.length,
                            itemBuilder: (ctx, i) {
                              var listAtributes = controller.atributosDados
                                  .value.sections?.first.attributes?[i];
                              return Column(
                                children: [
                                  buildAttributeViewOld(
                                      listAtributes!,
                                      i,
                                      controller,
                                      ctx,
                                      _debounce ??
                                          Timer(Duration(seconds: 5), () {}),
                                      (bool) {}),
                                  SizedBox(height: 15),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: BKOpenButton(
                          text: "Confirmar",
                          imageRight: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                          ),
                          imagePadding: 10,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              // Se todos os campos estiverem preenchidos, salve os dados
                              await controller.salvarAtributosDinamicosDados();
                            } else {
                              // Exibe um aviso se algum campo estiver vazio
                              return;
                            }
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
