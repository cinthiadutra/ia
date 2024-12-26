import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:bkopen/ProposalsAndContracts/controllers/proposal_controller.dart';
import 'package:bkopen/app/enums/enum_emprestimos.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';

class DropwdownEmprestimo extends StatefulWidget {
  ProposalController controller;

  DropwdownEmprestimo({
    super.key,
    required this.controller,
  });

  @override
  State<DropwdownEmprestimo> createState() => _DropwdownEmprestimoState();
}

class _DropwdownEmprestimoState extends State<DropwdownEmprestimo> {
  @override
  Widget build(BuildContext context) {
    var wd = Get.width;
    var ht = Get.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tipo de oferta", style: Styles.subTextDetails),
        SizedBox(
          height: 8,
        ),
        Obx(
          () => SizedBox(
            width: Get.width * .85,
            height: 40,
            child: DropdownSearch<Emprestimos>(
              itemAsString: (item) => item.label,
              onChanged: (value) {
                widget.controller.selectedLoanType.value = value!;
                widget.controller.update();
              },
              selectedItem: widget.controller.selectedLoanType.value,
              popupProps: PopupProps.menu(
                  itemBuilder: (context, item, isSelected) {
                    return Container(
                        height: 40,
                        color: item == widget.controller.selectedLoanType.value
                            ? BKOpenColors.secondary.withOpacity(.3)
                            : BKOpenColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.label,
                            style: Styles.labelText.copyWith(
                              color: item ==
                                      widget.controller.selectedLoanType.value
                                  ? BKOpenColors.secondary
                                  : BKOpenColors.blackSub,
                            ),
                          ),
                        ));
                  },
                  listViewProps: ListViewProps(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      addSemanticIndexes: false),
                  searchFieldProps: TextFieldProps(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, left: 10),
                          hintMaxLines: 2,
                          hintText: "Buscar",
                          border: OutlineInputBorder(),
                          constraints:
                              BoxConstraints.tight(Size(wd * .83, ht * .052)))),
                  constraints: BoxConstraints.tight(Size(wd * .85, ht * .45)),
                  menuProps: MenuProps(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  fit: FlexFit.loose,
                  showSearchBox: true),
              dropdownButtonProps: DropdownButtonProps(
                  icon: Icon(
                Icons.expand_more_outlined,
                color: BKOpenColors.primary,
              )),
              dropdownDecoratorProps: DropDownDecoratorProps(
                baseStyle: Styles.labelText,
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                dropdownSearchDecoration: InputDecoration(
                  constraints:
                      BoxConstraints(maxHeight: ht * .45, minHeight: ht * .45),
                  hoverColor: BKOpenColors.primary,
                  contentPadding: EdgeInsets.only(left: 15, top: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: BKOpenColors.borderGrey, // Cor do contorno cinza
                      width: 1.0,
                      // Largura do contorno
                    ),
                  ),
                ),
              ),
              onSaved: (newValue) {
                widget.controller.emprestimoSelecionado.value = newValue!.label;
              },
              items: Emprestimos.values.toList(),
            ),
          ),
        )
      ],
    );
  }
}
