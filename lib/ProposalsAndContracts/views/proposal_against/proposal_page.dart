import 'package:bkopen/ProposalsAndContracts/components/proposal_tile_proposta.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../loan/components/spinner_options.dart';
import '../../components/proposal_tile.dart';

class ProposalPage extends GetView<ProposalController> {
  const ProposalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Propostas'),
                  Tab(text: 'Contratos'),
                  Tab(text: 'Histórico'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 12.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ContainerWithSpinner(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.listaPropostas.value.length,
                              itemBuilder: (context, index) {
                                return ProposalTileProposta(
                                  index: index,
                                  model: controller.jornada!.value,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }
                }),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 12.0),
                      child: Column(
                        children: [
                          ContainerWithSpinner(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.listaPropostas.value.length,
                              itemBuilder: (context, index) {
                                return ProposalTile(
                                  index: index,
                                  model: controller.jornada!.value,
                                  controller: controller,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 12.0),
                      child: Column(
                        children: [
                          ContainerWithSpinner(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.listaPropostas.value.length,
                              itemBuilder: (context, index) {
                                return ProposalTile(
                                  index: index,
                                  model: controller.jornada!.value,
                                  controller: controller,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        );
      })),
    );
  }
}

class Recipe {
  final String title;
  final String description;

  Recipe({required this.title, required this.description});
}
