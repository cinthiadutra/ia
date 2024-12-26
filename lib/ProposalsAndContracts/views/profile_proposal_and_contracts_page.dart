import 'package:bkopen/app/navigation/mangos_nav_bar/view/components/bkopen_nav_bar_component.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/ProposalsAndContracts/components/filtro_expanded.dart';
import 'package:bkopen/ProposalsAndContracts/components/history_tile.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/contract_tile.dart';
import '../components/proposal_tile.dart';
import '../controllers/proposal_controller.dart';

class ProfileProposalAndContractsPage extends StatefulWidget {
  ProfileProposalAndContractsPage({super.key});

  @override
  State<ProfileProposalAndContractsPage> createState() =>
      _ProfileProposalAndContractsPageState();
}

final controller = Get.find<ProposalController>();

class _ProfileProposalAndContractsPageState
    extends State<ProfileProposalAndContractsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        Future.microtask(() => controller.closeFilter());
      }
    });

    Future.microtask(() => controller.filterPropostas());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 3,
            indicatorColor: BKOpenColors.secondary,
            labelColor: BKOpenColors.secondary,
            unselectedLabelColor: BKOpenColors.greyTitleTab,
            labelStyle:
                Styles.labelText.copyWith(color: BKOpenColors.secondary),
            tabs: const [
              Tab(text: 'Propostas'),
              Tab(text: 'Contratos'),
              Tab(text: 'Histórico'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent(
              isLoading: controller.isLoading,
              list: controller.listaPropostas,
              tileBuilder: (index, model) => ProposalTile(
                index: index,
                model: model,
                controller: controller,
              ),
            ),
            _buildTabContent(
              isLoading: controller.isLoading,
              list: controller.listaPropostas,
              tileBuilder: (index, model) =>
                  ContractTile(index: index, model: model),
            ),
            _buildTabContent(
              isLoading: controller.isLoading,
              list: controller.listaPropostas,
              tileBuilder: (index, model) =>
                  HistoryTile(index: index, models: model),
            ),
          ],
        ),
        bottomNavigationBar: BKOpenNavbarComponent(),
      ),
    );
  }

  Widget _buildTabContent({
    required RxBool isLoading,
    required Rx<List> list,
    required Widget Function(int, dynamic) tileBuilder,
  }) {
    return Obx(() {
      if (isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BKOpenSpacing.x8,
                FiltroExpanded(
                  controller: controller,
                ),
                BKOpenSpacing.x8,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.value.length,
                  itemBuilder: (context, index) {
                    return tileBuilder(index, list.value[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
