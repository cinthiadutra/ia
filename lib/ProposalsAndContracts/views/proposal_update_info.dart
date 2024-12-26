import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/ProposalsAndContracts/views/update_section_page.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar_jornada.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposalUpdateInfo extends StatefulWidget {
  const ProposalUpdateInfo({super.key});

  @override
  State<ProposalUpdateInfo> createState() => _ProposalUpdateInfoState();
}

class _ProposalUpdateInfoState extends State<ProposalUpdateInfo> {
  final controller = Get.find<ProposalController>();
  int currentPage = 1; // Página atual
  final int itemsPerPage = 6;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>(); // Número de itens por página

    return Obx(() {
      final sections = controller.atributosProposta.value.sections;
      // Função para validar se todos os campos estão preenchidos
 if (sections == null || sections.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return Scaffold(
        appBar: BKAppBarJornada(
          label: controller.atributosProposta.value.sections?.first.attributes
                  ?.first.attribute?.viewjornadaEtapaId ??
              '',
          isEtapaDesejo: false, rota: () { controller.salvarAtributosDinamicosaoCancelar(); },
        ),
        body: GestureDetector(
          onHorizontalDragUpdate: (_) {}, // Absorve o gesto de deslizar
          child: PageView.builder(
            controller: controller.pageControllerLocalP,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sections.length,
            itemBuilder: (context, index) {
              bool isLastPage = index == sections.length - 1;
              bool oneSection = 1 == sections.length;
              return Column(
                children: [
                  Expanded(
                    child: Obx(() => SectionUpdatePage(
                          formKey: _formKey,
                          onNext: () => _handleNext(index, isLastPage),
                          section: sections[index],
                          page: ((sections[(index)].section?.ordem) ?? 5),
                          fields: controller.atributosFinais.value,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              children: [
                                isLastPage
                                    ? BKOpenButton(
                                        text: 'Finalizar',
                                        onTap: () {
                                          if (oneSection) {
                                            onSaveSectionOne(index);
                                          }
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _finishForm();
                                          } else {
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
                                          if (_formKey.currentState!
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
                                    _handleBackWithConfirmation(index);
                                  },
                                  backgroundColor: BKOpenColors.white,
                                  textColor: BKOpenColors.primary,
                                  borderColor: BKOpenColors.primary,
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              );
            },
          ),
        ),
      );
    });
  }

  void _handleNext(int index, bool isLastPage) {
    if (controller.hasNextSection(index)) {
      // Salva a seção atual e prossegue para a próxima
      onSaveSection(index); // Passa o índice da seção atual
      controller.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onSaveSectionOne(int index) async {
    await controller
        .salvarAtributosDinamicosDesejo(); // Passa a seção atual para o método
  }

  void onSaveSection(int index) {
    // Salva apenas a seção atual
    CoDynamicSectionDTO currentSection =
        controller.atributosFinais.value.sections![index];
    controller.salvarAtributosDaSecao(
        currentSection); // Passa a seção atual para o método
  }

  void onSaveSectionFim(int index) {
    // Salva apenas a seção atual
    CoDynamicSectionDTO currentSection =
        controller.atributosFinais.value.sections![index];

    controller.salvarAtributosDaSecaoFinal(
        currentSection); // Passa a seção atual para o método
  }

  void _finishForm() async {
    // Salva a última seção antes de finalizar
    onSaveSectionFim(controller.pageController.page!.toInt());
    // Salva a seção atual
  }

  void _handleBackWithConfirmation(int index) {
    Get.dialog(
      AlertDialog(
        title: Text("Confirmar"),
        content: Text("Deseja realmente apagar os dados preenchidos?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Fecha o diálogo
            },
            child: Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              _clearSectionData(index); // Limpa os dados
              Get.back(); // Fecha o diálogo
              _handleBack(index); // Volta para a página anterior
            },
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  void _clearSectionData(int index) {
    CoDynamicSectionDTO currentSection =
        controller.atributosFinais.value.sections![index];

    // Reseta os atributos da seção atual
    if (currentSection.attributes != null) {
      for (var attribute in currentSection.attributes!) {
        attribute.value = null; // Define o valor como nulo
      }
    }

    // Atualiza o estado no controlador
    controller.atributosFinais.refresh();
  }

  void _handleBack(int index) {
    // Limpa os dados da seção atual antes de voltar
    _clearSectionData(index);

    // Retorna para a página anterior
    if (controller.pageController.page!.toInt() > 0) {
      controller.pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.back(); // Sai da página se for a primeira seção
    }
  }
}
