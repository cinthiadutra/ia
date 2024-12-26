import 'dart:async';
import 'dart:developer';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/loan/data/models/co_dynamic_attribute_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart'; // Para usar o Getx Controller
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/models/co_result_dto_tabela.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:validatorless/validatorless.dart';

const Duration debounceDuration = Duration(milliseconds: 500);

class AutocompleteCustom extends StatefulWidget {
  CoDynamicAttributeDTO attributeDTO;
  String textCampo;
  TextEditingController option;

  AutocompleteCustom(
      {super.key,
      required this.attributeDTO,
      required this.textCampo,
      required this.option});
  @override
  State<AutocompleteCustom> createState() => _AutocompleteState();
}

final controller = Get.find<LoanProposalController>();

class _AutocompleteState extends State<AutocompleteCustom> {
  @override
  void initState() {
    super.initState();
  }

  // Função que filtra as sugestões baseadas no padrão (pattern)
  Future<List<TabelaDto>> suggestionsCallback(String pattern) async {
    if (controller.tabelaDto.value.isEmpty) {
      controller.filterTabela(pattern);
    }
    return Future.delayed(
      Duration(milliseconds: 300),
      () => controller.tabelaDto.value.where((value) {
        final nameLower = value.nome?.toLowerCase().split(' ').join('');
        final patternLower = pattern.toLowerCase().split(' ').join('');
        return nameLower!.contains(patternLower);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<TabelaDto>(
      suggestionsCallback: (pattern) async {
        // Verifica se o padrão tem mais de 5 caracteres antes de chamar a função de busca
        if (pattern.length > 2) {
          // Retorna as sugestões filtradas
          return await suggestionsCallback(pattern);
        } else {
          // Retorna uma lista vazia se o padrão for menor ou igual a 5 caracteres
          return [];
        }
      },
      controller: widget.option,
      autoFlipDirection: true,
      itemBuilder: (context, suggestion) {
        // Define como cada item será exibido
        return ListTile(
          title: Text(suggestion.nome ?? 'Sem nome'),
          subtitle: Text(suggestion.id.toString()),
        );
      },
      onSelected: (value) {
        // Verifica se o item selecionado não é nulo
        log('Você selecionou ${value.nome}');
        // Atualiza o campo de texto com o ID do item selecionado
        widget.option.text = value.nome!;
        controller.tabela.text = value.id.toString();
        widget.attributeDTO.value = value.id;
        widget.attributeDTO.changed = true;
        controller.municipio.text = value.nome!;
      },
      builder: (context, textEd, focusNode) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.textCampo,
              style: Styles.textForm,
            ),
            BKOpenSpacing.x8,
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                controller: textEd,
                focusNode: focusNode,
                autofocus: true,
                decoration: InputDecoration(
                  fillColor: BKOpenColors.borderGrey,
                  constraints: BoxConstraints.loose(Size(Get.width * .9, 50)),
                  border: OutlineInputBorder(),
                  hintText: "Insira um Município",
                ),
                validator: Validatorless.required('Insira um Municipio'),
                // onChanged: (item) {
                //   controller.municipio.text = item;
                //   textcontroller.text = item;
                // },
              ),
            ),
          ],
        );
      },
    );
  }
}
