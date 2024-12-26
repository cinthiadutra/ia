import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar_jornada.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';
import 'package:bkopen/loan/views/loan_section_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoanSolicitedInfosSimuledPage extends StatefulWidget {
  const LoanSolicitedInfosSimuledPage({super.key});

  @override
  State<LoanSolicitedInfosSimuledPage> createState() =>
      _LoanSolicitedInfosSimuledPageState();
}

class _LoanSolicitedInfosSimuledPageState
    extends State<LoanSolicitedInfosSimuledPage> {
  final controller = Get.find<LoanProposalController>();

  int currentPage = 1;
  // Página atual
  final int itemsPerPage = 6;
  // Número de itens por página
  @override
  Widget build(BuildContext context) {
  final formKey = GlobalKey<FormState>(); // Número de itens por página

    return Obx(() {
      final sections = controller.atributosProposta.value.sections;
      // Função para validar se todos os campos estão preenchidos

      if (sections == null || sections.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }

      return Scaffold(
        appBar: BKAppBarJornada(
          label: sections.first.name ?? '',
          isEtapaDesejo: false,
          rota: () {
            controller.salvarAtributosDinamicosaoCancelar();
          },
        ),
        body: GestureDetector(
          onHorizontalDragUpdate: (_) {}, // Absorve o gesto de deslizar
          child: PageView.builder(
            controller: controller.pageControllerLocal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              bool isLastPage = index == sections.length - 1;

              return Column(
                children: [
                  Expanded(
                    child: Obx(() => LoanSectionPage(
                          fields: controller.atributosSimulacao.value,
                          formKey: formKey,
                          onNext: () => _handleNext(index, isLastPage),
                          section: sections[index],
                          page: ((sections[(index)].section?.ordem) ?? 5),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              children: [
                                isLastPage
                                    ? BKOpenButton(
                                        text: 'Finalizar',
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            // onSaveSection(
                                            //     controller.pageController.page!.toInt());
                                            _finishForm();
                                          } else {
                                            // Exibe um aviso se algum campo estiver vazio
                                            Get.snackbar(
                                              "Erro",
                                              "Por favor, preencha todos os campos antes de continuar.",
                                              backgroundColor: Colors.redAccent,
                                              colorText: Colors.white,
                                            );
                                          }
                                        },
                                        backgroundColor: BKOpenColors.primary,
                                      )
                                    : BKOpenButton(
                                        text: 'Próximo',
                                        onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            _handleNext(index, isLastPage);
                                          } else {
                                            // Exibe um aviso se algum campo estiver vazio
                                            Get.snackbar(
                                              "Erro",
                                              "Por favor, preencha todos os campos antes de continuar.",
                                              backgroundColor: Colors.redAccent,
                                              colorText: Colors.white,
                                            );
                                          }
                                        },
                                        backgroundColor: BKOpenColors.primary,
                                      ),
                                BKOpenSpacing.x16,
                                BKOpenButton(
                                  text: 'Voltar',
                                  onTap: () {
                                    Get.back();
                                  },
                                  backgroundColor: BKOpenColors.white,
                                  textColor: BKOpenColors.primary,
                                  borderColor: BKOpenColors.primary,
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              );
            },
          ),
        ),
      );
    });
  }

  void _handleNext(int index, bool isLastPage) {
    if (!isLastPage && controller.hasNextSection(index)) {
      // Salva a seção atual e prossegue para a próxima
      onSaveSection(index); // Passa o índice da seção atual
      controller.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onSaveSection(int index) {
    // Salva apenas a seção atual
    CoDynamicSectionDTO currentSection =
        controller.atributosProposta.value.sections![index];
    controller.salvarAtributosDaSecaoProposta(
        currentSection); // Passa a seção atual para o método
  }

  void onSaveSectionFim(int index) {
    // Salva apenas a seção atual
    CoDynamicSectionDTO currentSection =
        controller.atributosSimulacao.value.sections![index];
    controller.salvarAtributosDaSecaoFinalProposta(
        currentSection); // Passa a seção atual para o método
  }

  void _finishForm() async {
    // Salva a última seção antes de finalizar
    onSaveSectionFim(controller.pageController.page!.toInt());
    // Salva a seção atual
  }
}
