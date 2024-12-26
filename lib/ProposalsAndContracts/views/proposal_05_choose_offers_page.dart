import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';
import 'package:bkopen/loan/views/loan_section_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposalChooseOffersPage extends StatefulWidget {
  const ProposalChooseOffersPage({super.key});

  @override
  State<ProposalChooseOffersPage> createState() =>
      _ProposalChooseOffersPageState();
}

class _ProposalChooseOffersPageState extends State<ProposalChooseOffersPage> {
  final controller = Get.find<ProposalController>();
  int currentPage = 1; // Página atual
  final int itemsPerPage = 6;

  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  final _formKey3 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sections = controller.atributosSimulacao.value.sections;
      // Função para validar se todos os campos estão preenchidos

      return Scaffold(
        appBar: BKAppBar(
          label: 'Escolha de Ofertas',
          estaNahome: true,
        ),
        body: GestureDetector(
          onHorizontalDragUpdate: (_) {}, // Absorve o gesto de deslizar
          child: PageView.builder(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: sections?.length,
            itemBuilder: (context, index) {
              bool isLastPage = index == sections!.length - 1;
              return Column(
                children: [
                  Expanded(
                    child: Obx(() => LoanSectionPage(
                          formKey: index == 0
                              ? _formKey
                              : index == 1
                                  ? _formKey2
                                  : _formKey3,
                          onNext: () => _handleNext(index, isLastPage),
                          section: sections[index],
                          page: ((sections[(index)].section?.ordem) ?? 5) - 3,
                          fields: controller.atributosSimulacao.value,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Column(
                              children: [
                                isLastPage
                                    ? BKOpenButton(
                                        text: 'Finalizar',
                                        onTap: () {
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
                                            _handleNext(index,
                                                isLastPage); // Avançar se a validação for bem-sucedida
                                          } else {
                                            Get.snackbar(
                                              "Erro de Validação",
                                              "Preencha todos os campos obrigatórios.",
                                              backgroundColor: Colors.redAccent,
                                              colorText: Colors.white,
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
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
        controller.atributosSimulacao.value.sections![index];
    controller.salvarAtributosDaSecao(
        currentSection); // Passa a seção atual para o método
  }

  void onSaveSectionFim(int index) {
    // Salva apenas a seção atual
    CoDynamicSectionDTO currentSection =
        controller.atributosSimulacao.value.sections![index];
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
        controller.atributosSimulacao.value.sections![index];

    // Reseta os atributos da seção atual
    if (currentSection.attributes != null) {
      for (var attribute in currentSection.attributes!) {
        attribute.value = null; // Define o valor como nulo
      }
    }

    // Atualiza o estado no controlador
    controller.atributosSimulacao.refresh();
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