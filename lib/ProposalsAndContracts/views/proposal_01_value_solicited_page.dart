// ignore_for_file: avoid_types_as_parameter_names

import 'dart:async';

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/loan/components/build_old_atributes.dart';
import 'package:bkopen/loan/components/etapa_widget.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/styles.dart';

class ProposalValueSolicitedPage extends StatefulWidget {
  const ProposalValueSolicitedPage({super.key});

  @override
  State<ProposalValueSolicitedPage> createState() =>
      _ProposalValueSolicitedPageState();
}

class _ProposalValueSolicitedPageState
    extends State<ProposalValueSolicitedPage> {
  final controller = Get.find<ProposalController>();
  final loan = Get.find<LoanProposalController>();


  final _formKey = GlobalKey<FormState>();

  Timer? _debounce;

  // Função para validar se todos os campos estão preenchidos
  bool _validateFields() {
    final attributes =
        controller.atributosDesejo.value.sections?.first.attributes;
    if (attributes == null || attributes.isEmpty) return false;

    // Verifica se algum campo de atributo está vazio ou nulo
    return attributes.every((attribute) =>
        attribute.value != null && attribute.value.toString().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(
          label: '',
          estaNahome: true,
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
                    "Personalizando ofertas para você",
                    style: Styles.h3Strong,
                  ),
                  BKOpenSpacing.x16,
                  EtapaWidget(
                    page: '1',
                    label: controller.atributosDesejo.value.sections?.first
                            .section?.nome ??
                        '',
                  ),
                  GetBuilder<ProposalController>(
                      init: controller,
                      builder: (_) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BKOpenSpacing.x24,
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.atributosDesejo.value
                                  .sections?.first.attributes?.length,
                              itemBuilder: (ctx, i) {
                                var listAtributes = controller.atributosDesejo
                                    .value.sections?.first.attributes?[i];
                                return Column(
                                  children: [
                                    buildAttributeViewOld(
                                        listAtributes!,
                                        i,
                                        loan,
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
                      }),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
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
                            if (_validateFields()) {
                              // Se todos os campos estiverem preenchidos, salve os dados
                              await controller.salvarAtributosDinamicosDesejo();
                            } else {
                              // Exibe um aviso se algum campo estiver vazio
                              Get.snackbar(
                                "Erro",
                                "Por favor, preencha todos os campos antes de continuar.",
                                backgroundColor: Colors.redAccent,
                                colorText: Colors.white,
                              );
                            }
                          }
                        },
                      ),
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
