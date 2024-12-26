import 'dart:async';

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/loan/components/build_old_atributes.dart';
import 'package:bkopen/loan/data/models/co_result_dto_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/loan/components/build_atributte_view.dart';
import 'package:bkopen/loan/components/etapa_widget.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/models/co_dynamic_section_dto.dart';

class SectionUpdatePage extends StatefulWidget {
  final CoDynamicSectionDTO section;
  final VoidCallback onNext;
  final dynamic page;
  final Widget? child;
  GlobalKey<FormState>formKey;
   final CoDynamicFieldsDto fields;


   SectionUpdatePage({
    super.key,
    required this.section,
    required this.onNext,
    required this.page,
    required this.formKey,
    this.child, required this.fields,
  });

  @override
  State<SectionUpdatePage> createState() => _SectionUpdatePageState();
}

class _SectionUpdatePageState extends State<SectionUpdatePage> {
  Timer? _debounce;
  final controller = Get.find<ProposalController>();
  final loanController = Get.find<LoanProposalController>();
   @override
  void initState() {
    super.initState();

    // Garantir que todos os attributes.constant sejam mapeados no início
    widget.section.attributes?.forEach((attribute) {
      if (attribute.constant != null) {
        loanController.constantsMap.putIfAbsent(attribute.constant!, () => null);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Form( // Envolvendo o conteúdo em um Form
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EtapaWidget(
              page: widget.page.toString(),
              label: widget.section.name!,
            ),
            BKOpenSpacing.x16,
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.section.attributes?.length,
              itemBuilder: (context, attributeIndex) {
                var attributes = widget.section.attributes![attributeIndex];
                return Column(
                  children: [
                    GetBuilder<LoanProposalController>(
                      builder: (controller) {
                        return buildAttributeViewOld(
                          attributes,
                          attributeIndex,
                          loanController,
                          context,
                          _debounce ?? Timer(Duration(seconds: 5), () {}),
                          (value) {
                            if (attributes.constant != null) {
                              loanController.constantsMap[attributes.constant!] = value;
                              debugPrint("Updated constantsMap: ${loanController.constantsMap}");
                            }
                            // setState(() {});
                          },
                        );
                      }
                    ),
                    SizedBox(height: 15),
                  ],
                );
              },
            ),
            SizedBox(height: 10),
            Center(
              child:  widget.child
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
