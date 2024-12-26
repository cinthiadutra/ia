import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/enums/enum_emprestimos.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/utils/curency_text_input_mask.dart';
import 'package:bkopen/app/utils/loader_mixin.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:bkopen/loan/data/loan_repository.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_parceiro.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_product.dart';
import 'package:bkopen/loan/data/models/co_base_list_dto.dart';
import 'package:bkopen/loan/data/models/co_dynamic_attribute_dto.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';
import 'package:bkopen/loan/data/models/co_result_dto_fields.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_atribute.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornadai.dart';
import 'package:bkopen/loan/data/models/co_result_dto_tabela.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:bkopen/loan/data/models/request_jornada_dto.dart';
import 'package:bkopen/loan/data/models/options_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/models/co_result_dto_jornada_etapa.dart';

class LoanProposalController extends GetxController with LoaderMixin {
  RxBool isLoading = true.obs;
  RxBool isExpanded = true.obs;
  RxBool isExpandedOther = true.obs;
  RxBool showField = false.obs;
  RxList<CoDynamicAttributeDTO> attributesList = <CoDynamicAttributeDTO>[].obs;
  dynamic someValue;
  List<OptionsList> listSelectedI = [];
  Rx<String> selectedItem = Rx('');
  Rx<String> selectedCheckbox = Rx('');
  Rx<int> idClient = Rx(0);
  Rx<int> produtoParceiroId = Rx(0);
  Rx<int> agenteParceiroId = Rx(0);

  TextEditingController tabela = TextEditingController();
  Rx<List<TabelaDto>> tabelaDto = Rx([]);
  Rx<List<int>> selectedOptionsIds = Rx([]);
  // RxList<OptionsList> selectedOptionsItems = <OptionsList>[].obs;

  Rx<CoDynamicFieldsDto> atributosFinais = CoDynamicFieldsDto().obs;
  var selectedOptionsItems = <OptionsList>[].obs;
  Rx<List<JornadaDTO>> listProsposta = Rx([]);
  TextEditingController selectedController = TextEditingController();
  Rx<int> criterio = Rx(0);
  Rx<int> idsJ = Rx(0);
  Rx<int> idsInit = Rx(0);
  Rx<int> idsProposta = Rx(0);

  Rx<int> jornadaEtapaIdSim = Rx(0);

  CoResultDtoJornadaEtapa? jornadaEtapa;
  CoResultDtoJornadaEtapa? jornadaEtapa2;
  CoResultDtoJornadaEtapa? jornadaEtapaSimulacao;
  CoResultDtoJornadaAtribute? detailSimulation;

  int get totalPages =>
      (listPropostasSimuladas!.data!.length / itemsPerPage.value).ceil();

  Rx<int> currentPage = Rx(1);
  Rx<int> itemsPerPage = Rx(3);
  CoResultDtoJornadaEtapa? jornadaEtapaProposta;

  JornadaEtapaDto? jornadaReq;
  JornadaEtapaDto jornadaSeelected = JornadaEtapaDto();

  CoResultDtoParceiro? parceiroDto;

  final loadingMessage = ''.obs;
  Rx<int> jornadaIds = Rx(0);
  Rx<int> idJornadaEtapas = Rx(0);

  int? jornadaId;
  int? idJornadaEtapa;

// Lista de produtos ou serviços
  var products = <ProdutoParceiroDto>[].obs;

  // Índice do produto selecionado
  var selectedPJIndex =
      0.obs; // Começando com 0 ou -1 para indicar que nada está selecionado
  List<TabelaDto> filteredSuggestions = [];
  // Método para selecionar um produto
  void selectProduct(int index) {
    selectedPJIndex.value = index; // Atualiza o índice do produto selecionado
    // Você pode adicionar lógica adicional aqui, como carregar detalhes do produto
  }

  Rx<List<JornadaEtapaDto>>? propostasToShow = Rx([]);

  RxList<OptionsList>? listBool = [
    OptionsList(id: 0, name: 'Não'),
    OptionsList(id: 1, name: 'Sim'),
  ].obs;

  RxList<OptionsList>? selectedMultiItems = [OptionsList()].obs;

  var atributosSimulacao = CoDynamicFieldsDto().obs;
  var atributosProposta = CoDynamicFieldsDto().obs;

  var pageController = PageController();
  var pageControllerLocal = PageController();

  TextEditingController dataNascimento = TextEditingController();
  TextEditingController genero = TextEditingController();
  TextEditingController estadoCivil = TextEditingController();
  TextEditingController nacionalidade = TextEditingController();
  TextEditingController banco = TextEditingController();

  TextEditingController ocupacao = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController renda = TextEditingController();
  TextEditingController saldo = TextEditingController();
  TextEditingController dinheiro = TextEditingController();
  TextEditingController prazo = TextEditingController();
  TextEditingController taxaJ = TextEditingController();
  TextEditingController amortizacao = TextEditingController();
  TextEditingController item5 = TextEditingController();

  TextEditingController estado = TextEditingController();
  TextEditingController municipio = TextEditingController();
  TextEditingController cepController = TextEditingController();

  Rx<List<ProdutoParceiroDto>> listProduct = Rx([]);
  List<ProdutoParceiroDto> listaProdutos = [];

  Rx<List<CoDynamicSectionDTO>> fields = Rx([]);
  CoResultDtoJornadaI? jornadasI;
  CoResultDtoJornadaI? jornadasSimulada;
  CoResultDtoJornadaEtapa? listPropostasSimuladas;
  Rx<List<JornadaEtapaDto>>? jornadaEtapaOut;
  Rx<CoDynamicFieldsDto> atributos = CoDynamicFieldsDto().obs;
  Rx<CoDynamicFieldsDto> atributosDados = CoDynamicFieldsDto().obs;
  Rx<CoDynamicFieldsDto> atributosDesejo = CoDynamicFieldsDto().obs;

  Rx<CoDynamicFieldsDto> atributosSimulacaos = CoDynamicFieldsDto().obs;

  final repository = Get.find<LoanRepository>();
  final appController = Get.find<AppController>();

  RxString selectedOption = 'Filtros'.obs; // Opção padrão selecionada

  RxBool uploadPhotoVisible = true.obs;
  RxString amountString = "".obs;
  RxDouble amountDouble = 0.0.obs;
  var imagePath = ''.obs;
  var isImageSaved = false.obs;
  CurrencyTextInputMaskController edtControllerAmount =
      CurrencyTextInputMaskController();
  Rx<double> parcela = Rx<double>(1000.0);
  Rx<double> totalMontante = Rx<double>(0.0);
  Rx<double> juros = Rx<double>(Emprestimos.autoEquity.juros);
  Rx<double> valorReal = Rx<double>(8);

  Rx<double> jurosAnual = Rx<double>(0.0);
  RxBool isExpandedOffer = true.obs;

  RxBool obscureText = true.obs;

  RxBool selectPersonPFOrPJ = true.obs;

  RxBool isFirstCardSelected = true.obs;

  var selectedIndexCard = (-1).obs;
  // RxBool isSecondSelected = false.obs;
  // RxBool isThirdSelected = false.obs;
  // RxBool isFourthSelected = false.obs;
  // RxBool isFifthSelected = false.obs;

  RxBool isPF = true.obs;
  Rx<String> selectedPersonalidade = Rx('305');

  RxInt selectedIndex =
      1.obs; // Índice do item selecionado, -1 se nenhum estiver selecionado
  Map<String, dynamic> constantsMap = {};
  RxString title = ''.obs;

  TextEditingController info1 = TextEditingController();

  @override
  void onInit() {
    selectedItem.value = '';

    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    final loadingMessage = ''.obs;
    loaderListener(isLoading, loadingMessage);
    super.onInit();
  }

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

  void limparHistorico() {
    jornadaEtapa = null;
    atributosDados.value = CoDynamicFieldsDto();
    atributos.value = CoDynamicFieldsDto();
    atributosSimulacao.value = CoDynamicFieldsDto();
    jornadaEtapa2 = null;
    jornadaEtapaProposta = null;
    jornadaEtapaSimulacao = null;
    jornadaReq = null;
    detailSimulation = null;
    parceiroDto = null;
    jornadasSimulada = null;
    jornadasI = null;
    atributosFinais.value = CoDynamicFieldsDto();
    listPropostasSimuladas = CoResultDtoJornadaEtapa();
    selectedOption.value = '';
    atributosDesejo.value = CoDynamicFieldsDto();
    dataNascimento.text = '';
  }

  void loadPage(int page) {
    currentPage.value = page;
    int start = (page - 1) * itemsPerPage.value;
    int end = page * itemsPerPage.value;
    if (end > atributosSimulacao.value.sections!.first.attributes!.length) {
      end = atributosSimulacao.value.sections!.first.attributes!.length;
    }

    propostasToShow?.value = listPropostasSimuladas!.data!.sublist(start, end);
  }

  ///salva os atributos de cada seção
  Future<void> salvarAtributosDaSecao(CoDynamicSectionDTO secaoAtual) async {
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
        (success) {
          isLoading.value = false;
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {}
        },
      );
    } catch (e) {
      Get.snackbar("Erro", "Ocorreu um erro inesperado ao salvar a seção");
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

  ///salva os atributos de cada seção
  Future<void> salvarAtributosDaSecaoProposta(
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
        (success) {
          isLoading.value = false;
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {}
        },
      );
    } catch (e) {
      Get.snackbar("Erro", "Ocorreu um erro inesperado ao salvar a seção");
    }
  }

//salva os atributos da seção final
  Future<void> salvarAtributosDaSecaoFinalProposta(
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
          if (success.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            atributosFinais.value = success.data!;
          }
          // await simularJornada();
        },
      );
    } catch (e) {
      Get.snackbar("Erro", "Ocorreu um erro inesperado ao salvar a seção");
    }
  }

  // void uploadPhoto() {
  //   if (uploadPhotoVisible.value) {
  //     uploadPhotoVisible.value = false;
  //   } else {
  //     uploadPhotoVisible.value = true;
  //   }
  // }

  // void selectIndex(int index) {
  //   selectedIndex.value = index;
  // }

  // void selectItem(String item) {
  //   selectedItem.value = item;
  // }

  // Future<void> pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     await saveFile(file);
  //   }
  // }

  // Future<void> saveFile(File file) async {
  //   try {
  //     Directory appDocDir = await getApplicationDocumentsDirectory();
  //     String appDocPath = appDocDir.path;
  //     final File newFile =
  //         await file.copy('$appDocPath/${file.path.split('/').last}');
  //     imagePath.value = newFile.path;
  //     isImageSaved.value = true;
  //   } catch (e) {
  //     Get.snackbar('Erro', 'Erro ao salvar o arquivo: $e');
  //   }
  // }

  // Future<dynamic> buscarCep({required String cep}) {
  //   var cepFomatado = cep.replaceAll('.', '').replaceAll('-', '');
  //   final postCep = PostmonSearchCep();
  //   final postCepInfo = postCep.searchInfoByCep(cep: cepFomatado);
  //   return postCepInfo;
  // }

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

        Get.toNamed(PageRoutes.loanoptionspage);
      }
    });
  }

  /// inicia a jornada
  Future<void> insertJornada() async {
    limparHistorico();
    isLoading.value = true;
    if (appController.clientId == null || appController.clientId == 0) {
      appController.filterClient(id: appController.iduser.value);
      idClient.value = appController.clientId ?? idClient.value;
    }

    final response = await repository.insertJornada(
        request: RequestJornadaDto(
            classname: 'JornadaDTO',
            classeProdutoId: 1,
            clienteId: appController.clientId,
            agenteNegocioId: 3));

    response.fold((e) {
      isLoading.value = false;

      _handleError("Erro",
          "Ocorreu um erro inesperado. Tente novamente mais tarde ou entre em contato com o suporte.");
    }, (sucess) async {
      isLoading.value = false;
      if (sucess.withError == true) {
        _handleError("Erro", 'Ocorreu um erro inesperado');
      } else {
        jornadasI = sucess;
        jornadaId = sucess.data?.id;
        await filterJornadaEtapa(jornadaId: sucess.data?.id ?? 0);
        log("Jornada ID: $jornadaId");
      }
    });
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterJornadaEtapa({required int jornadaId}) async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapa(jornadaId: jornadaId);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      isLoading.value = false;
      jornadaEtapa = sucess;
      idsInit.value = sucess.data!.first.id!;

      await carregarAtributosDinamicosDesejos();
    });
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> carregarAtributosDinamicos(List<int> ids) async {
    try {
      isLoading.value = true;

      final result = await repository.carregarAtributosDinamicos(ids);
      result.fold(
        (error) {
          isLoading.value = false;
          _handleError("Erro", "Falha ao carregar atributos dinâmicos");
        },
        (sucess) {
          isLoading.value = false;
          atributos.value = sucess.data!; // Armazena os atributos carregados
        },
      );
      dataNascimento.clear();
      info1.clear();
      item5.clear();
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao carregar atributos");
    }
  }

  Future<void> avancarEtapas() async {
    // loadingMessage.value =
    //     "Estamos registrando os dados e preparando a próxima etapa. Aguarde!";
    isLoading.value = true;
    try {
      if (jornadaEtapa?.data == null) {
        filterJornadaEtapa(jornadaId: jornadaId!);
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
        idsJ.value = success.data!.first.id!;
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

    try {
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
              .loansolicitedinfospage); // Armazena os atributos carregados
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao carregar atributos");
    }
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> carregarAtributosDinamicosDesejos() async {
    isLoading.value = true;

    try {
      final result =
          await repository.carregarAtributosDinamicos([idsInit.value]);
      result.fold(
        (error) {
          isLoading.value = false;
          _handleError("Erro", "Falha ao carregar atributos dinâmicos");
        },
        (sucess) {
          isLoading.value = false;
          atributosDesejo.value = sucess.data!;
          Get.toNamed(PageRoutes
              .loanvaluesolicitedpage); // Armazena os atributos carregados
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
          atributosDados.value = atributosDesejo.value;
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
          idsJ.value = success.data?.first.id ?? 0;
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
      final result = await repository.carregarAtributosDinamicos([idsJ.value]);
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
                .loanchooseofferspage); // Armazena os atributos carregados
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
          _handleError("Erro", "Falha ao carregar atributos dinâmicos");
        },
        (sucess) async {
          isLoading.value = false;

          jornadasSimulada = sucess;
          await filterPropostas();
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao carregar atributos");
    }
  }

  /// Método para carregar os atributos dinâmicos
  Future<void> filterPropostas() async {
    loadingMessage.value =
        "Recebemos os dados e estamos selecionando as melhores ofertas para o seu cliente!";
    isLoading.value = true;

    try {
      final result = await repository.filterJornadaEtapaPropostas(
          jornadaId: jornadaId!,
          jornada: criterio.value,
          clienteId: appController.clientId!);
      result.fold(
        (error) {
          isLoading.value = false;
          Get.toNamed(PageRoutes.loanofferspage);
          _handleError("Erro", "Falha ao carregar atributos dinâmicos");
        },
        (sucess) {
          isLoading.value = false;
          if (sucess.withError == true) {
            _handleError("Erro", "Falha ao salvar atributos dinâmicos");
          } else {
            listPropostasSimuladas = sucess;
            Get.toNamed(
                PageRoutes.loanofferspage); // Armazena os atributos carregados
          }
        },
      );
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado ao carregar atributos");
    }
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterTabela(String query) async {
    final response = await repository.filterTabela(nome: query);
    response.fold((erro) {
      isLoading.value = false;
      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) {
      isLoading.value = false;
      tabelaDto.value = sucess.data!;
      filteredSuggestions = sucess.data!;
      // Atualize as sugestões no widget
      update();
    });
  }

  Future<List<TabelaDto>> filterTab(String tab) async {
    // Simula um tempo de espera como se fosse uma chamada de API
    filterTabela(tab);

    final allData = tabelaDto.value;

    // Filtra os dados com base na query
    final filteredData = allData.where((item) {
      return item.nome!.toLowerCase().contains(tabela.text.toLowerCase());
    }).toList();

    tabelaDto.value = filteredData;
    return filteredData; // Retorna a lista filtrada de TabelaDto
  }

  bool evaluateCondition(String sentence) {
    try {
      // Substituir variáveis no formato {VAR} pelos valores no contexto
      constantsMap.forEach((key, value) {
        sentence = sentence.replaceAll('{$key}', value?.toString() ?? 'null');
      });

      // Tratar casos especiais, como "None" e listas
      sentence = sentence.replaceAll('None', 'null');

      // Analisar condições básicas
      bool result = true;

      // Dividir pela lógica "and"
      List<String> conditions = sentence.split('and');
      for (var condition in conditions) {
        condition = condition.trim();

        if (condition.startsWith('not')) {
          // Tratar "not" como negação
          condition = condition.substring(3).trim();
          if (_evaluateSingleCondition(condition)) {
            result = false;
            break;
          }
        } else {
          if (!_evaluateSingleCondition(condition)) {
            result = false;
            break;
          }
        }
      }

      return result;
    } catch (e) {
      // Retorna falso se ocorrer algum erro
      print('Erro ao avaliar condição: $e');
      return false;
    }
  }

  bool _evaluateSingleCondition(String condition) {
    try {
      // Tratar comparações de desigualdade
      if (condition.contains('!=')) {
        var parts = condition.split('!=');
        var left = parts[0].trim();
        var right = parts[1].trim();
        return left != right;
      }
      // Tratar condições "in"
      else if (condition.contains('in')) {
        var parts = condition.split('in');
        var left = parts[0].trim();
        var right = parts[1].trim();

        // Extrair a lista do lado direito
        if (right.startsWith('[') && right.endsWith(']')) {
          // Remover os colchetes e dividir os elementos
          var list = right.substring(1, right.length - 1).split(',');

          // Converter elementos da lista para inteiros
          var intList = list
              .map((e) => int.tryParse(e.trim()))
              .where((e) => e != null)
              .toList();

          // Tentar converter o valor da esquerda para inteiro
          var leftInt = int.tryParse(left);

          // Verificar se o valor convertido está na lista
          if (leftInt != null) {
            return intList.contains(leftInt);
          }
        }
      }
      // Tratar igualdade
      else if (condition.contains('==')) {
        var parts = condition.split('==');
        var left = parts[0].trim();
        var right = parts[1].trim();
        return left == right;
      }
      // Tratar null diretamente
      else if (condition == 'null') {
        return false;
      }
    } catch (e) {
      print('Erro ao avaliar condição única: $e');
    }

    return false;
  }

// // Método auxiliar para resolver variáveis
//   dynamic _resolveVariable(String variable) {
//     // Simula a resolução de uma variável, substitua pelo que for necessário no seu caso
//     var variableMap = {
//       '{CS_ESTADOCIVIL}': '105', // Exemplo de mapeamento
//     };

//     return variableMap[variable] ?? variable;
//   }

  void validateNextAttributeCondition(
      int currentIndex, List<CoDynamicAttributeDTO> attributes) {
    // Verifique se o índice atual está dentro dos limites da lista de atributos
    if (currentIndex < 0 || currentIndex >= attributes.length) {
      return; // Retorna se o índice for inválido
    }

    // Verifique se o próximo atributo existe
    if (currentIndex + 1 < attributes.length) {
      CoDynamicAttributeDTO nextAttribute = attributes[currentIndex + 1];

      // Valide a condição `sentence` do próximo atributo
      bool isVisible = nextAttribute.sentence != null
          ? evaluateCondition(nextAttribute.sentence!)
          : true;

      // Atualize a visibilidade do próximo atributo
      nextAttribute.visible = isVisible;

      // Se o próximo atributo também tiver um `sentence`, podemos verificar se o próximo após esse também precisa ser visível
      if (isVisible) {
        validateNextAttributeCondition(currentIndex + 1, attributes);
      }

      // Notifique as alterações para que a UI seja atualizada
      update();
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
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        throw Exception(
            "Permissão para acessar o armazenamento negada. Voce precisa dessa permissão para salvar documentos no seu Aparelho");
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

  /// metodo que tras os detalhes da simulacao
  Future<void> simulacaodetail() async {
    log("Proposta selecionada: ${jornadaSeelected.id}");
    isLoading.value = true;

    final response =
        await repository.simulacaoDetail(request: jornadaSeelected);

    response.fold((erro) {
      isLoading.value = false; // Corrigido
      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) {
      isLoading.value = false; // Corrigido

      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao buscar os detalhes da simulação");
      } else {
        detailSimulation = sucess;
        jornadaEtapaIdSim.value = sucess.data!.first.jornadaEtapaId!;
        Get.toNamed(PageRoutes.loanproposalresumepage);
      }
    });
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterJornadaEtapaProposta() async {
    isLoading.value = true;

    final response =
        await repository.filterJornadaEtapaProposta(jornadaId: jornadaId!);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao filtrar jornada etapa das propostas");
      } else {
        isLoading.value = false;
        jornadaEtapaProposta = sucess;

        await avancarEtapasProposta();
      }
    });
  }

  Future<void> avancarEtapasProposta() async {
    isLoading.value = true;
    try {
      jornadaEtapaProposta?.data?.forEach((e) {
        e.produtoParceiroId = produtoParceiroId.value;
      });
      // Enviar para o repositório
      var result = await repository.avancarEtapas(
          request: CoBaseListDto(
              classname: "CoBaseListDTO", data: jornadaEtapaProposta!.data));

      result.fold((error) {
        isLoading.value = false;

        _handleError("Erro", "Falha ao avançar propostas");
      }, (success) async {
        isLoading.value = false;
        if (success.withError == true) {
          _handleError("Erro", "Falha ao avançar etapas");
        } else {
          idsJ.value = success.data?.first.id ?? 0;
          criterio.value = success.data!.first.jornada!;
          jornadaReq = success.data!.first;
          carregarAtributosDinamicosProposta();
        }
      });
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  /// Método para carregar os atributos dinâmicos da proposta
  Future<void> carregarAtributosDinamicosProposta() async {
    isLoading.value = true;

    final result = await repository.carregarAtributosDinamicos([idsJ.value]);
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
              .loansolicitedinfossimuledpage); // Armazena os atributos carregados
        }
      },
    );
  }

  String formatCurrency(String value) {
    // Converte a String para double, caso não seja um valor numérico, retorna "0.00"
    double amount = double.tryParse(value) ?? 0.00;

    // Formata o valor para o padrão brasileiro de moeda
    final formatCurrency =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return formatCurrency.format(amount);
  }

  // void filterByInterestRate(bool ascending) {
  //   propostasToShow!.value.sort((a, b) => ascending
  //       ? a.compareTo(b.interestRate)
  //       : b.interestRate.compareTo(a.interestRate));
  // }

  // void filterByInstallmentValue(bool ascending) {
  //   propostasToShow..sort((a, b) => ascending
  //       ? a.installmentValue.compareTo(b.installmentValue)
  //       : b.installmentValue.compareTo(a.installmentValue));
  // }

  // void filterByDateRange(String starts, String ends) {
  //   var start = DateTime.parse(starts);
  //   var end = DateTime.parse(ends);

  //   propostasToShow!.value = listPropostasSimuladas!.data!
  //       .where((proposta) =>
  //           proposta.inicio!.isAfter(start) &&
  //           proposta.firstInstallment.isBefore(end))
  //       .toList();
  // }

  // void filterByStatus() {
  //   propostasToShow.value = listProposal.value.where((proposta) {
  //     return selectedStatus.isEmpty || selectedStatus.contains(proposta.status);
  //   }).toList();
  // }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterForParceiro({required int agenteParceiroId}) async {
    isLoading.value = true;
    final response = await repository.filterParceiro(
        id: produtoParceiroId.value, agenteParceiroId: agenteParceiroId);

    response.fold((erro) {
      isLoading.value = false; // Corrigido
      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      isLoading.value = false; // Corrigido
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao filtrar parceiros");
      } else {
        parceiroDto = sucess;
        debugPrint('Proposta mantida: ${jornadaSeelected.id}');
        await simulacaodetail(); // Aguarda a chamada assíncrona
      }
    });
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
              classname: "CoBaseListDTO", data: [jornadaSeelected]));

      result.fold((error) {
        isLoading.value = false;

        _handleError("Erro", "Falha ao avançar propostas");
      }, (success) async {
        isLoading.value = false;
        if (success.withError == true) {
          _handleError("Erro", "Falha ao avançar etapas");
        } else {
          idsJ.value = success.data?.first.id ?? 0;
          criterio.value = success.data!.first.jornada!;
          jornadaReq = success.data!.first;
          idsProposta.value = success.data!.last.id!;
          filterJornadaEtapaBuscarProposta();
        }
      });
    } catch (e) {
      isLoading.value = false;
      _handleError("Erro", "Erro inesperado: $e");
    }
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterJornadaEtapaBuscarProposta() async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapaProposta(
        jornadaId: idsProposta.value);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao filtrar jornada etapa das propostas");
      } else {
        isLoading.value = false;
        jornadaEtapaProposta = sucess;

        await carregarAtributosDinamicosProposta();
      }
    });
  }
  // Método alternativo
}
