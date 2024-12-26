import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/ProposalsAndContracts/views/profile_proposal_and_contracts_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bkopen/ProposalsAndContracts/components/card_status.dart';
import 'package:bkopen/ProposalsAndContracts/components/dropwdown_emprestimo.dart';
import 'package:bkopen/ProposalsAndContracts/components/text_field_data.dart';
import 'package:bkopen/ProposalsAndContracts/components/text_field_data_fim.dart';

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';

class FiltroExpanded extends StatefulWidget {
  ProposalController controller;
  FiltroExpanded({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FiltroExpanded> createState() => _FiltroExpandedState();
}

class _FiltroExpandedState extends State<FiltroExpanded> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    var ht = MediaQuery.of(context).size.height;
    return Obx(() => Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: BKOpenColors.borderGrey),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Filtros',
                        style: Styles.textInput
                            .copyWith(color: BKOpenColors.primary),
                      ),
                      Icon(
                        Icons.filter_alt_outlined,
                        size: 18,
                        color: BKOpenColors.primary,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      
                      widget.controller.isExpandedFilter.value =
                          !widget.controller.isExpandedFilter.value;
                    },
                    icon: Icon(
                      widget.controller.isExpandedFilter.value
                          ? Icons.expand_less
                          : Icons.expand_more,
                      color: BKOpenColors.primary,
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: widget.controller.isExpandedFilter.value ? ht * 0.45 : 0,
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(
                      height: ht * 0.10,
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 4.2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 4),
                          itemCount: widget.controller.statuses.length,
                          itemBuilder: (context, i) {
                            final status = widget.controller.statuses[i];
                            return Obx(() {
                              final isSelected = widget
                                  .controller.selectedStatus
                                  .contains(status);
                              return GestureDetector(
                                  onTap: () {
                                    widget.controller.toggleStatus(status);
                                  },
                                  child: CardStatus(
                                    nome: status.nome,
                                    colors: isSelected
                                        ? BKOpenColors.secondary
                                        : Colors.white,
                                    textColor: isSelected
                                        ? Colors.white
                                        : BKOpenColors.secondary,
                                  ));
                            });
                          }),
                    ),
                    SizedBox(height: 4.0),
                    DropwdownEmprestimo(
                      controller: controller,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Data da Proposta',
                      style: Styles.subTextDetails,
                    ),
                    SizedBox(height: 6.0),
                    TextFieldData(
                        texto: 'De', controllerEC: widget.controller.dateC),
                    SizedBox(height: 8.0),
                    TextFieldDataFim(
                        texto: 'Até', controllerECF: widget.controller.dateF),
                    SizedBox(height: 16.0),
                    BKOpenButton(
                      height: 40,
                      width: wd * 0.85,
                      text: 'Filtrar propostas',
                      onTap: () {
                        if (widget.controller.dateC.text.isNotEmpty &&
                            widget.controller.dateF.text.isNotEmpty) {
                          // widget.controller.filterByDateRange(
                          //     widget.controller.dateC.text, widget.controller.dateF.text);
                          widget.controller.isExpandedFilter.value = false;
                        } else {
                          // widget.controller.selectedStatus.isNotEmpty
                          //     ? widget.controller
                          //         .filterByStatus()
                          //     : null;
                        }
                        // widget.controller.applyFilter();
                      },
                    ),
                    BKOpenSpacing.x16
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
