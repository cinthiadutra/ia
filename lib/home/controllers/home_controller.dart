import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/core/controller/app_controller.dart';
import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:bkopen/app/utils/loader_mixin.dart';
import 'package:bkopen/home/data/models/co_result_dto_exhomedto.dart';
import 'package:bkopen/home/data/models/jornada_dto.dart';
import 'package:bkopen/home/data/repositories/home_repository.dart';
import 'package:bkopen/loan/data/models/co_Result_dto_parceiro.dart';
import 'package:bkopen/loan/data/models/co_base_list_dto.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_atribute.dart';
import 'package:bkopen/loan/data/models/co_result_dto_jornada_etapa.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:bkopen/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController with LoaderMixin {
  final RxBool isLoading = true.obs;
  final RxList<bool> isSelectedList = List.generate(8, (_) => false).obs;
  var imagePath = ''.obs;
  var isImageSavedPerfil = false.obs;
  final profileController = Get.find<ProfileController>();
  final appController = Get.find<AppController>();
  final proposalController = Get.find<ProposalController>();
  CoResultDtoParceiro? parceiroDto;
  Rx<int> agenteParceiroId = Rx(0);

  Rx<int> jornadaEtapaIdSim = Rx(0);
  Rx<int> ids = Rx(0);
  Rx<int> produtoParceiroId = Rx(0);
  Rx<int> criterio = Rx(0);
  JornadaEtapaDto? jornadaReq;
  Rx<int> idsProposta = Rx(0);
  CoResultDtoJornadaEtapa? jornadaEtapaProposta;

  final repository = Get.find<HomeRepository>();
  final storage = Get.find<LocalStorage>();
  Rx<CoResultDtoHomeload> home = Rx(CoResultDtoHomeload());
  Rx<List<JornadaDTO>> listProsposta = Rx([]);
  Rx<String> name = Rx('EN');
  CarouselController carouselController = CarouselController();
  CoResultDtoJornadaEtapa? jornadaEtapaHome;
  CoResultDtoJornadaAtribute? detailSimulation;
  @override
  void onInit() {
    profileController.loadImageFromPreferences();
    Timer(Duration(seconds: 3), () {
      isLoading.value = false;
    });
    super.onInit();
  }

  void toggleSelected(int index) {
    for (int i = 0; i < isSelectedList.length; i++) {
      if (i == index) {
        isSelectedList[i] = !isSelectedList[i];
      } else {
        isSelectedList[i] = false;
      }
    }
  }

/*
  List<String> getListBanners(){
    print(' entrei no getListImages()');
    List<String> listImages = [];
    print(bannersData.imagens.length);

    bannersData.forEach((url) {
      listImages.add(url);
      print('url');
      print(url);
    });

    return listImages;
  }

 */

  List<BannerModel> getListBannersData() {
    int i = 0;
    List<BannerModel> listBanners = [];

    List<String> listLinkBanners = [
      "assets/images/png/Frame1.png",
      "assets/images/png/Frame1.png",
    ];
    for (var link in listLinkBanners) {
      i++;
      BannerModel bannerModel = BannerModel(
          imagePath: link, id: i.toString(), boxFit: BoxFit.fitWidth);
      listBanners.add(bannerModel);
    }

    return listBanners;
  }

  void loadImageFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? path = prefs.getString('imagePathPerfil');
    if (path != null) {
      imagePath.value = path;
      isImageSavedPerfil.value = true;
    }
  }

  // Future<void> loadHome() async {
  //   isLoading.toggle();
  //   final response = await repository.loadHome();

  //   response.fold((erro) {
  //     Get.snackbar("Erro ao realizar load", response.toString(),
  //             duration: const Duration(seconds: 5),
  //             snackStyle: SnackStyle.FLOATING,
  //             backgroundColor: BKOpenColors.accentRed)
  //         .show();

  //     isLoading.toggle();
  //   }, (sucess) {
  //     log(sucess.toString());

  //     isLoading.toggle();
  //   });
  // }

  Future<void> filterJornada() async {
    isLoading.value == true;
    final response = await repository.filterJornada();

    response.fold((erro) {
      isLoading.value == false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      isLoading.value == false;

      listProsposta.value = sucess.data!;

      log(sucess.toString());
      await filterJornadaEtapaHome(
          jornadaId: listProsposta.value.first.id!,
          jornada: listProsposta.value.first.jornada!);
    });
  }

  /// metodo que filtra as jornadas Etapas
  Future<void> filterJornadaEtapaHome(
      {required int jornadaId, required int jornada}) async {
    isLoading.value = true;

    final response = await repository.filterJornadaEtapa(
        jornadaId: jornadaId, jornada: jornada);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      isLoading.value = false;
      jornadaEtapaHome = sucess;
      ids.value = sucess.data!.first.id!;
      agenteParceiroId.value = sucess.data?.first.agenteParceiroId ?? 0;
      produtoParceiroId.value = sucess.data?.first.produtoParceiroId ?? 0;
    });
  }

  /// metodo que tras os detalhes da simulacao
  Future<void> simulacaodetail() async {
    isLoading.value = true;

    final response = await repository.simulacaoDetail(
        request: jornadaEtapaHome!.data!.first);

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
      }
    });
  }

  Future<void> avancarEtapasBuscarProposta() async {
    isLoading.value = true;
    try {
      jornadaEtapaHome?.data?.forEach((e) {
        e.produtoParceiroId = produtoParceiroId.value;
      });
      // Enviar para o repositório
      var result = await repository.gerarProposta(
          request: CoBaseListDto(
              classname: "CoBaseListDTO",
              data: [jornadaEtapaHome!.data!.first]));

      result.fold((error) {
        isLoading.value = false;

        _handleError("Erro", "Falha ao avançar propostas");
      }, (success) async {
        isLoading.value = false;
        if (success.withError == true) {
          filterJornadaEtapaBuscarProposta();
        } else {
          ids.value = success.data?.first.id ?? 0;
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
        jornadaId: idsProposta.value, jornada: criterio.value);

    response.fold((erro) {
      isLoading.value = false;

      _handleError('Erro', 'Erro ao buscar jornada');
    }, (sucess) async {
      if (sucess.withError == true) {
        _handleError("Erro", "Falha ao filtrar jornada etapa das propostas");
      } else {
        isLoading.value = false;
        jornadaEtapaProposta = sucess;

        proposalController.carregarAtributosDinamicosProposta(
            ids: jornadaEtapaHome?.data?.first.jornadaOriId);
      }
    });
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
      if (!await Permission.storage.request().isDenied) {
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
        debugPrint('Proposta mantida: ${jornadaEtapaHome?.data?.first ?? ''}');
        // Aguarda a chamada assíncrona
      }
    });
  }
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
