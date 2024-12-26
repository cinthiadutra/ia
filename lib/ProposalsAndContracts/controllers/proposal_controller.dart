// ignore_for_file: collection_methods_unrelated_type

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bkopen/ProposalsAndContracts/data/proposal_repository.dart';
import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/enums/enum_emprestimos.dart';
import 'package:bkopen/app/enums/enum_status_proposta.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/utils/loader_mixin.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_parceiro.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_product.dart';
import 'package:bkopen/loan/data/models/co_base_list_dto.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';
import 'package:bkopen/loan/data/models/co_result_dto_fields.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_atribute.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_etapa.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornadai.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class ProposalController extends GetxController with LoaderMixin {
  RxBool isLoading = true.obs;
  RxBool obscureText = true.obs;
  Rx<bool> isExpanded = Rx(true);
  Rx<bool> isExpandedFilter = Rx(false);

  final loadingMessage = ''.obs;
  JornadaEtapaDto? jornadaReq;
  Rx<int> idsProposta = Rx(0);
  var atributosProposta = CoDynamicFieldsDto().obs;
  CoResultDtoJornadaEtapa? listPropostasSimuladas;

  var atributosSimulacao = CoDynamicFieldsDto().obs;
  var pageController = PageController();
  var pageControllerLocalP = PageController();

  CoResultDtoJornadaI? jornadasSimulada;
  Rx<CoDynamicFieldsDto> atributosDesejo = CoDynamicFieldsDto().obs;
  Rx<List<ProdutoParceiroDto>> listProduct = Rx([]);
  var selectedIndexCard = (-1).obs;
  Rx<int> produtoParceiroId = Rx(0);
  Rx<CoDynamicFieldsDto> atributosDados = CoDynamicFieldsDto().obs;
  CoResultDtoJornadaEtapa? jornadaEtapa2;
  TextEditingController info1 = TextEditingController();
  Rx<int> agenteParceiroId = Rx(0);
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController item5 = TextEditingController();
  JornadaEtapaDto jornadaSeelectedNego = JornadaEtapaDto();
  CoResultDtoJornadaEtapa? jornadaEtapaProposta;

  int? jornadaId;
  Rx<int> criterio = Rx(0);
  Rx<int> idJornada = Rx(0);
  Rx<int> idJornadas = Rx(0);

  CoResultDtoJornadaEtapa? jornadaEtapa;
  Rx<CoDynamicFieldsDto> atributosFinais = CoDynamicFieldsDto().obs;

  TextEditingController tipoEmprestimo = TextEditingController();
  Rx<Emprestimos> selectedLoanType = Rx<Emprestimos>(Emprestimos.consignado);
  var selectedStatus = <StatusPropostaEnum>[].obs;
  final List<StatusPropostaEnum> statuses = StatusPropostaEnum.values;
  CoResultDtoJornadaEtapa? listPropostasExs;
  Rx<int> jornadaIds = Rx(0);
  CoResultDtoJornadaAtribute? detailSimulationOut;
  Rx<CoResultDtoFields>? jornadaUpdate;

  final repository = Get.find<ProposalRepository>();
  final appController = Get.find<AppController>();
  final loanController = Get.find<LoanProposalController>();

  Rx<JornadaDTO>? jornada = Rx(JornadaDTO());
  List<JornadaDTO>? propostas;
  void _handleError(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 4),
    );
  }

  RxString emprestimoSelecionado = 'Selecione'.obs;
  late String option;
  // Valor inicial selecionado
  final dateC = TextEditingController();
  final dateF = TextEditingController();

  final Rx<List<JornadaDTO>> listaPropostas = Rx([]);

  final Rx<List<JornadaEtapaDto>> listaPropostasEnviadas = Rx([]);
  final Rx<List<JornadaEtapaDto>> listaPropostasEmNegociacao = Rx([]);

  final Rx<JornadaEtapaDto> propostasEnviadas = Rx(JornadaEtapaDto());

  final timeC = TextEditingController();
  final timeRequest = TextEditingController();
  Rx<String> emprestimo = Rx('Selecione'); // Valor inicial selecionado
  final Rx<DateTime> today = Rx<DateTime>(DateTime.now());
  final TimeOfDay timeOfDay = TimeOfDay.now();
  var startDate = Rxn<DateTime>();
  var endDate = Rxn<DateTime>();
  // Rx<List<String>> statuses = Rx([
  //   'Em análise',
  //   'Contra proposta',
  //   'Pendência',
  //   'Em formalização',
  //   'Rejeitado',
  //   'Expirado',
  // ]);
  Rx<List<JornadaDTO>> filteredProposals = Rx([]);
  CoResultDtoParceiro? parceiroDto;

  @override
  void onInit() {
    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    option = StatusPropostaEnum.pendencia.name;
    filteredProposals.value = listaPropostas.value;
    loaderListener(isLoading, loadingMessage);
    super.onInit();
  }

  bool getValueObscureText() {
    if (obscureText.value == true) {
      obscureText.value = false;
    } else {
      obscureText.value = true;
    }

    return obscureText.value;
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterForParceiro(
      {required int agenteParceiroId, required int produtoParceiroId}) async {
    final response = await repository.filterParceiro(
        id: produtoParceiroId, agenteParceiroId: agenteParceiroId);

    response.fold((erro) {
      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao filtrar parceiros");
      } else {
        parceiroDto = sucess;
        debugPrint('Proposta mantida: ${jornadaSeelectedNego.id}');
        await simulacaodetailOut(); // Aguarda a chamada assíncrona
      }
    });
  }

  Color getStatusColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue; // Em análise
      case 1:
        return Colors.green; // Contra proposta
      case 2:
        return Colors.orange; // Pendência
      case 3:
        return Colors.yellow; // Em formalização
      case 4:
        return Colors.red; // Rejeitado
      case 5:
        return Colors.grey; // Expirado
      default:
        return Colors.black;
    }
  }

  void toggleStatus(StatusPropostaEnum status) {
    if (selectedStatus.contains(status)) {
      selectedStatus.remove(status);
    } else {
      selectedStatus.add(status);
    }
  }

  void closeFilter() {
    isExpanded.value = false;
  }

  Future displayDatePicker(BuildContext context) async {
    var date = await showDatePicker(
      locale: Locale('pt', 'BR'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2060),
    );

    if (date != null) {
      dateC.text = DateFormat("dd/MM/yyyy").format(date);
    }
  }

  Future displayDatePickerFim(BuildContext context) async {
    var date = await showDatePicker(
      locale: Locale('pt', 'BR'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2060),
    );

    if (date != null) {
      dateF.text = DateFormat("dd/MM/yyyy").format(date);
    }
  }

  // void filterProposalStatus(StatusPropostaEnum status) {
  //   selectedStatus.first = status;
  //   if (status.isEmpty {
  //     filteredProposals.value = listaPropostas.value;
  //   } else {
  //     filteredProposals.value = listaPropostas.value
  //         .where((proposta) => proposta.status == status)
  //         .toList();
  //   }
  // }

  void filterProposals(String query) {
    if (query.isEmpty) {
      filteredProposals.value = listaPropostas.value;
    } else {
      filteredProposals.value = listaPropostas.value
          .where(
              (proposta) => proposta.viewjornada!.contains(query.toLowerCase()))
          .toList();
    }
  }

  // void filterByInterestRate(bool ascending) {
  //   listaPropostas.value.sort((a, b) => ascending
  //       ? a.  compareTo(b.interestRate)
  //       : b.interestRate.compareTo(a.interestRate));
  // }

  // void filterByInstallmentValue(bool ascending) {
  //   filteredProposals.value.sort((a, b) => ascending
  //       ? a.installmentValue.compareTo(b.installmentValue)
  //       : b.installmentValue.compareTo(a.installmentValue));
  // }

  // void filterByDateRange(String starts, String ends) {
  //   var start = DateTime.parse(starts);
  //   var end = DateTime.parse(ends);

  //   filteredProposals.value = listaPropostas.value
  //       .where((proposta) =>
  //           proposta..isAfter(start) &&
  //           proposta.firstInstallment.isBefore(end))
  //       .toList();
  // }

  void filterByStatus(int index) {
    filteredProposals.value = listaPropostas.value.where((proposta) {
      return selectedStatus.isEmpty ||
          selectedStatus
              .contains(proposta.jornada ?? StatusPropostaEnum.restricao.name);
    }).toList();
  }

  void setStartDate(String date) {
    startDate.value = DateFormat().parse(date);
  }

  void setEndDate(String date) {
    endDate.value = DateFormat().parse(date);
  }

  // /// Método para carregar os atributos dinâmicos da proposta
  // Future<void> carregarAtributosDinamicos({required idJornada}) async {
  //   isLoading.value = true;

  //   final result = await repository.carregarAtributosDinamicos([idJornada]);
  //   result.fold(
  //     (error) {
  //       isLoading.value = false;
  //       _handleError("Erro", "Falha ao carregar atributos dinâmicos");
  //     },
  //     (sucess) {
  //       isLoading.value = false;
  //       if (sucess.withError == true) {
  //         _handleError("Erro", "Falha ao salvar atributos dinâmicos");
  //       } else {
  //         jornadaUpdate?.value = sucess;
  //         atributosDesejo.value = sucess.data!;
  //         Get.toNamed(PageRoutes
  //             .loansolicitedinfospage); // Armazena os atributos carregados
  //       }
  //     },
  //   );
  // }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterJornadaEtapa(
      {required int jornadaId, required int jornada}) async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapa(
        jornadaId: jornadaId, jornada: jornada);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      isLoading.value = false;
      jornadaEtapa = sucess;
      idJornada.value = sucess.data!.first.id!;
      if (sucess.data?.first.viewjornada == "Desejo") {
        await carregarAtributosDinamicosDesejos();
      } else {
        await carregarAtributosDinamicosDados([idJornada.value]);
      }
    });
  }

  Future<void> filterPropostas() async {
    isLoading.value = true;

    final response =
        await repository.filterJornadaUser(clienteId: appController.clientId!);

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value = false;
      if (sucess.withError == true) {
        _handleError("Erro", 'Celular já está cadastrado. Utilize outro');
      } else {
        listaPropostas.value = sucess.data!;
      }
    });
  }

  Future<void> filterDetailPropostas(
      {required int jornadaId,
      required int jornada,
      required int index}) async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapaPropostas(
        clienteId: appController.clientId!,
        jornadaId: jornadaId,
        jornada: jornada);

    response.fold((erro) {
      isLoading.value = false;
      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) async {
      isLoading.value = false;
      if (sucess.withError == true) {
        _handleError("Erro", 'erro ao filtrar propostas');
      } else if (sucess.data != null || sucess.data != []) {
        listaPropostasEnviadas.value = sucess.data!;
        agenteParceiroId.value = sucess.data?.first.agenteParceiroId ?? 0;

        simulacaodetailOut();
      } else {
        return;
      }
    });
  }

  Future<void> filterDetailPropostasNegociacao(
      {required int jornadaId,
      required int jornada,
      required int index}) async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapaPropostas(
        clienteId: appController.clientId!,
        jornadaId: jornadaId,
        jornada: jornada);

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) async {
      isLoading.value = false;

      if (sucess.withError == true) {
        _handleError("Erro", 'Celular já está cadastrado. Utilize outro');
      } else {
        listaPropostasEmNegociacao.value = sucess.data!;
        propostasEnviadas.value = sucess.data!.first;
        agenteParceiroId.value = sucess.data?.first.agenteParceiroId ?? 0;
        filterForParceiro(
            agenteParceiroId: sucess.data!.first.agenteParceiroId!,
            produtoParceiroId: sucess.data!.first.produtoParceiroId!);
        Get.toNamed(PageRoutes.proposalOffersPage);
      }
    });
  }

  Future<void> filterPropostasOut() async {
    loadingMessage.value =
        "Recebemos os dados e estamos selecionando as melhores ofertas para o seu cliente!";
    isLoading.value = true;

    final result = await repository.filterJornadaUserEtapa(
        jornadaEtapaId: jornadaIds.value);
    result.fold(
      (error) {
        isLoading.value = false;
        Get.toNamed(PageRoutes.loanofferspage);
        _handleError("Erro", "Falha ao carregar propostas");
      },
      (sucess) async {
        isLoading.value = false;
        if (sucess.withError == true) {
          _handleError("Erro", "Falha ao carregar proposta");
        } else {
          listPropostasExs = sucess;
          await simulacaodetailOut(); // Armazena os atributos carregados
        }
      },
    );
  }

  /// metodo que tras os detalhes da simulacao
  Future<void> simulacaodetailOut() async {
    isLoading.value = true;
    final response =
        await repository.simulacaoDetail(request: propostasEnviadas.value);

    response.fold((erro) {
      isLoading.value = false; // Corrigido
      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) {
      isLoading.value = false; // Corrigido
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao buscar os detalhes da simulação");
      } else {
        detailSimulationOut = sucess;
        Get.toNamed(PageRoutes.proposaldetailspage);
      }
    });
  }

  ///salva os atributos de cada seção
  Future<void> salvarAtributosDaSecao(CoDynamicSectionDTO secaoAtual) async {
    isLoading.value = true;

    CoDynamicFieldsDto secaoParaSalvar = CoDynamicFieldsDto(
      classname: "CoDynamicFieldsDTO",
      sections: [
        CoDynamicSectionDTO(
          classname: secaoAtual.classname,
          section: secaoAtual.section,
          name: secaoAtual.name,
          identifier: secaoAtual.identifier,
          itensPerPage: secaoAtual.itensPerPage,
          itensPerLine: secaoAtual.itensPerLine,
          attributes: secaoAtual.attributes,
        )
      ],
    );

    // Envia a seção filtrada ao repositório
    var result =
        await repository.salvarAtributosDinamicos(fields: secaoParaSalvar);

    // Tratamento do resultado da chamada
    result.fold(
      (error) {
        isLoading.value = false;

        Get.snackbar("Erro", "Falha ao salvar a seção");
      },
      (success) {
        isLoading.value = false;
        if (success.withError == true) {
          _handleError("Erro", "Falha ao salvar atributos dinâmicos");
        } else {}
      },
    );
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> simularJornada() async {
    loadingMessage.value =
        "Recebemos os dados e estamos selecionando as melhores ofertas para você!";
    isLoading.value = true;

    try {
      final result = await repository.simularJornada(
          jornadaId: jornadaId!, criterio: criterio.value);
      result.fold(
        (error) {
          isLoading.value = false;
          _handleError("Erro", "Falha ao salvar jornada");
        },
        (sucess) async {
          isLoading.value = false;

          jornadasSimulada = sucess;
          await filterPropostas();
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao salvar jornada");
    }
  }

  ///salva os atributos da seção final
  Future<void> salvarAtributosDaSecaoFinal(
      CoDynamicSectionDTO secaoAtual) async {
    isLoading.value = true;
    try {
      // if (atributosModificados.isNotEmpty) {
      // Cria uma cópia da seção com apenas os atributos modificados
      CoDynamicFieldsDto secaoParaSalvar = CoDynamicFieldsDto(
        classname: "CoDynamicFieldsDTO",
        sections: [
          CoDynamicSectionDTO(
            classname: secaoAtual.classname,
            section: secaoAtual.section,
            name: secaoAtual.name,
            identifier: secaoAtual.identifier,
            itensPerPage: secaoAtual.itensPerPage,
            itensPerLine: secaoAtual.itensPerLine,
            attributes: secaoAtual.attributes,
          )
        ],
      );

      // Envia a seção filtrada ao repositório
      var result =
          await repository.salvarAtributosDinamicos(fields: secaoParaSalvar);

      // Tratamento do resultado da chamada
      result.fold(
        (error) {
          isLoading.value = false;

          Get.snackbar("Erro", "Falha ao salvar a seção");
        },
        (success) async {
          isLoading.value = false;

          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            atributosFinais.value = success.data!;
          }

          await simularJornada();
        },
      );
    } catch (e) {
      Get.snackbar("Erro", "Ocorreu um erro inesperado ao salvar a seção");
    }
  }

  bool hasNextSection(int index) {
    return index < (atributosSimulacao.value.sections?.length ?? 0) - 1;
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> carregarAtributosDinamicosDesejos() async {
    isLoading.value = true;

    try {
      final result =
          await repository.carregarAtributosDinamicos([idJornada.value]);
      result.fold(
        (error) {
          isLoading.value = false;
          _handleError("Erro", "Falha ao carregar atributos dinâmicos");
        },
        (sucess) {
          isLoading.value = false;
          atributosDesejo.value = sucess.data!;
          Get.toNamed(PageRoutes
              .proposalvaluesolicitedpage); // Armazena os atributos carregados
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao carregar atributos");
    }
  }

  ///salvar atributos dinamicos pagina 1
  Future<void> salvarAtributosDinamicosDesejo() async {
    try {
      isLoading.value = false;

      atributosDesejo.value.sections?.forEach((e) {
        e.attributes?.forEach((atributos) {
          atributosFinais.value = atributosDesejo.value;
          atributos.changed = true;
        });
      });

      // Enviar para o repositório
      var result = await repository.salvarAtributosDinamicos(
          fields: atributosDesejo.value);

      result.fold(
        (error) => _handleError("Erro", "Falha ao salvar atributos dinâmicos"),
        (success) {
          isLoading.value = false;
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            filterProduct(
                jornadaId: success.data?.sections?.first.attributes?.first
                        .attribute?.jornadaId ??
                    0);
          }
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  ///filtra os produtos para o usuario escolher qual deseja
  Future<void> filterProduct({required int jornadaId}) async {
    isLoading.value = true;

    final response = await repository.filterProduct(idJornada: jornadaId);

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) {
      isLoading.value = false;
      if (sucess.withError == true) {
        _handleError(
            "Erro", 'Ocorreu um erro ao buscar os produtos para o usuario');
      } else {
        listProduct.value = sucess.data ?? [];

        Get.toNamed(PageRoutes.proposalproductpage);
      }
    });
  }

  Future<void> avancarEtapas() async {
    // loadingMessage.value =
    //     "Estamos registrando os dados e preparando a próxima etapa. Aguarde!";
    isLoading.value = true;
    try {
      if (jornadaEtapa?.data == null) {
        filterJornadaEtapa(jornadaId: jornadaId!, jornada: idJornada.value);
      } else {
        jornadaEtapa?.data?.forEach((e) {
          e.produtoParceiroId = produtoParceiroId.value;
        });
      }
      // Enviar para o repositório
      var result = await repository.avancarEtapas(
          request: CoBaseListDto(
              classname: "CoBaseListDTO", data: jornadaEtapa!.data));

      result.fold(
          (error) => _handleError(
              "Erro", "Falha ao avançar etapa atributos dinâmicos"),
          (success) async {
        selectedIndexCard.value = 0;
        isLoading.value = false;
        idJornada.value = success.data!.first.id!;
        jornadaEtapa2 = success;
        agenteParceiroId.value = success.data?.first.agenteParceiroId ?? 0;
        carregarAtributosDinamicosDados([success.data!.first.id!]);
      });
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> carregarAtributosDinamicosDados(List<int> ids) async {
    isLoading.value = true;

    final result = await repository.carregarAtributosDinamicos(ids);
    result.fold(
      (error) {
        isLoading.value = false;
        _handleError("Erro", "Falha ao carregar atributos dinâmicos");
      },
      (sucess) {
        isLoading.value = false;
        atributosDados.value = sucess.data!;
        Get.toNamed(PageRoutes
            .proposalsolicitedinfospage); // Armazena os atributos carregados
      },
    );
  }

  ///salvar atributos dinamicos pagina 1
  Future<void> salvarAtributosDinamicosDados() async {
    try {
      isLoading.value = false;

      atributosDados.value.sections?.forEach((e) {
        e.attributes?.forEach((atributos) {
          atributosDados.value = atributosDados.value;
          atributos.changed = true;
        });
      });

      // Enviar para o repositório
      var result = await repository.salvarAtributosDinamicos(
          fields: atributosDados.value);

      result.fold(
        (error) => _handleError("Erro", "Falha ao salvar atributos dinâmicos"),
        (success) {
          isLoading.value = false;
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            avancarEtapasSim();
          }
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  ///avançar
  Future<void> avancarEtapasSim() async {
    loadingMessage.value =
        "Processando as informações. Em breve você terá uma simulação personalizada.";
    isLoading.value = true;
    try {
      jornadaEtapa?.data?.forEach((e) {
        e.produtoParceiroId = produtoParceiroId.value;
      });
      // Enviar para o repositório
      var result = await repository.avancarEtapas(
          request: CoBaseListDto(
              classname: "CoBaseListDTO", data: jornadaEtapa2!.data));

      result.fold((error) {
        isLoading.value = false;

        _handleError("Erro", "Falha ao salvar atributos dinâmicos");
      }, (success) async {
        isLoading.value = false;
        if (success.withError == true) {
          _handleError("Erro", "Falha ao salvar atributos dinâmicos");
        } else {
          idJornada.value = success.data?.first.id ?? 0;
          criterio.value = success.data!.first.jornada!;
          jornadaReq = success.data!.first;
          carregarAtributosDinamicosSimulacao();
        }
      });
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> carregarAtributosDinamicosSimulacao() async {
    isLoading.value = true;

    try {
      final result =
          await repository.carregarAtributosDinamicos([idJornada.value]);
      result.fold(
        (error) {
          isLoading.value = false;
          _handleError("Erro", "Falha ao carregar atributos dinâmicos");
        },
        (sucess) {
          isLoading.value = false;
          if (sucess.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            atributosSimulacao.value = sucess.data!;
            Get.toNamed(PageRoutes
                .proposalsimulatefields); // Armazena os atributos carregados
          }
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao carregar atributos");
    }
  }

  ///salvar atributos dinamicos pagina 1
  Future<void> salvarAtributosDinamicosSimulacao() async {
    isLoading.value = true;
    try {
      // Marcar atributos como alterados e salvá-los
      atributosSimulacao.value.sections?.forEach((section) {
        section.attributes?.forEach((atributo) {
          // Verifique se o valor foi alterado antes de marcar como alterado
          atributosSimulacao.value = atributosSimulacao.value;
          atributo.changed = true;
        });
      });
      // Enviar para o repositório
      var result = await repository.salvarAtributosDinamicos(
          fields: atributosSimulacao.value);

      result.fold(
        (error) {
          isLoading.value = false;

          _handleError("Erro", "Falha ao salvar atributos dinâmicos");
        },
        (success) async {
          isLoading.value = false;
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            atributosFinais.value = success.data!;
          }
          dataNascimento.clear();
          info1.clear();
          item5.clear();
          await simularJornada();
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  Future<void> avancarEtapasBuscarProposta() async {
    isLoading.value = true;
    try {
      jornadaEtapaProposta?.data?.forEach((e) {
        e.produtoParceiroId = produtoParceiroId.value;
      });
      // Enviar para o repositório
      var result = await repository.gerarProposta(
          request: CoBaseListDto(
              classname: "CoBaseListDTO", data: [propostasEnviadas.value]));

      result.fold((error) {
        isLoading.value = false;

        _handleError("Erro", "Falha ao avançar propostas");
      }, (success) async {
        isLoading.value = false;
        if (success.withError == true) {
          _handleError("Erro", "Falha ao avançar etapas");
        } else {
          idJornada.value = success.data?.first.id ?? 0;
          criterio.value = success.data!.first.jornada!;
          jornadaReq = success.data!.first;
          idsProposta.value = success.data!.last.id!;
          filterJornadaEtapaBuscarProposta(
              ids: idsProposta.value, jornada: success.data!.first.jornada!);
        }
      });
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  Future<void> gerarResumoJornada({required int jornadaId}) async {
    isLoading.value = true;

    final result = await repository.baixarResumoJornada(jornadaId: jornadaId);
    result.fold(
      (error) {
        isLoading.value = false;
        _handleError(
            'Erro', 'Falha ao baixar o resumo da jornada: ${error.message}');
      },
      (arquivo) async {
        isLoading.value = false;

        // Nome do arquivo a ser salvo
        final nomeArquivo = "resumo_jornada_$jornadaId.pdf";

        // Salva o arquivo na pasta pública de Downloads
        await salvarArquivoNaPastaPublicaDownloads(arquivo, nomeArquivo);
      },
    );
  }

  Future<void> salvarArquivoNaPastaPublicaDownloads(
      File arquivo, String nomeArquivo) async {
    try {
      // Solicitar permissão para acessar armazenamento
      if (!await Permission.storage.request().isGranted) {
        throw Exception("Permissão para acessar o armazenamento negada.");
      }

      // Caminho para a pasta pública Downloads
      final downloadsPath = "/storage/emulated/0/Download";
      final caminhoDestino = "$downloadsPath/$nomeArquivo";

      // Copiar o arquivo para o local público de Downloads
      await arquivo.copy(caminhoDestino);
      await arquivo.open();

      log("Arquivo salvo em: $caminhoDestino");
    } catch (e) {
      log("Erro ao salvar o arquivo: $e");
    }
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterJornadaEtapaBuscarProposta(
      {required int ids, required int jornada}) async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapaProposta(
        jornadaId: ids, jornada: jornada);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao filtrar jornada etapa das propostas");
      } else {
        isLoading.value = false;
        jornadaEtapaProposta = sucess;
        jornada = jornadaEtapaProposta!.data!.first.jornada!;

        carregarAtributosDinamicosProposta(ids: sucess.data!.first.id!);
      }
    });
  }

  /// Método para carregar os atributos dinâmicos da proposta
  Future<void> carregarAtributosDinamicosProposta({required ids}) async {
    isLoading.value = true;

    final result = await repository.carregarAtributosDinamicos([ids]);
    result.fold(
      (error) {
        isLoading.value = false;
        _handleError("Erro", "Falha ao carregar atributos dinâmicos");
      },
      (sucess) {
        isLoading.value = false;
        if (sucess.withError == true) {
          _handleError("Erro", "Falha ao salvar atributos dinâmicos");
        } else {
          atributosProposta.value = sucess.data!;
          Get.toNamed(PageRoutes
              .proposalUpdateInfo); // Armazena os atributos carregados
        }
      },
    );
  }
    Future<void> salvarAtributosDinamicosaoCancelar() async {
    try {
      isLoading.value = false;

      atributosDados.value.sections?.forEach((e) {
        e.attributes?.forEach((atributos) {
          atributosDados.value = atributosDados.value;
          atributos.changed = true;
        });
      });

      // Enviar para o repositório
      var result = await repository.salvarAtributosDinamicos(
          fields: atributosDados.value);

      result.fold(
        (error) => _handleError("Erro", "Falha ao salvar atributos dinâmicos"),
        (success) {
          isLoading.value = false;
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            Get.offAllNamed(PageRoutes.homepage);
          }
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  // void limparHistorico() {
  // jornadaEtapa = null;
  // atributosDados.value = CoDynamicFieldsDto();
  // atributos.value = CoDynamicFieldsDto();
  // atributosSimulacao.value = CoDynamicFieldsDto();
  // jornadaEtapa2 = null;
  // jornadaEtapaProposta = null;
  // jornadaEtapaSimulacao = null;
  // jornadaReq = null;
  // detailSimulation = null;
  // parceiroDto = null;
  // jornadasSimulada = null;
  // jornadasI = null;
  // atributosFinais.value = CoDynamicFieldsDto();
  // listPropostasSimuladas = CoResultDtoJornadaEtapa();
  // selectedOption.value = '';
  // atributosDesejo.value = CoDynamicFieldsDto();
  // dataNascimento.text = '';  }
}
