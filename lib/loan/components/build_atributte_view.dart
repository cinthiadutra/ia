// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/widgets/text_inputs/complex_text_input.dart';
import 'package:bkopen/loan/components/auto_complete_textfield.dart';
import 'package:bkopen/loan/components/dropdown_custom_dynamic.dart';
import 'package:bkopen/loan/components/dropdown_multiselect.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:bkopen/loan/data/models/co_dynamic_attribute_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:validatorless/validatorless.dart';

Widget buildAttributeView(
    CoDynamicAttributeDTO attributes,
    int index,
    LoanProposalController controller,
    BuildContext context,
    Timer debounce,
    Function(dynamic)? funcao) {
  final uniqueItems = attributes.attribute!.opcoes!
      .toSet() // Remover duplicados com base no objeto
      .toList();
  // Converter de volta para lista

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '', // Sem símbolo, pois adicionaremos com MoneyInputFormatter
    decimalDigits: 2,
  );
  switch (attributes.attribute?.viewtipoAtributo) {
    case "Data":
      return Visibility(
        visible: attributes.visible == false
            ? controller.evaluateCondition(attributes.sentence!)
            : true,
        child: GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate:
                  DateTime(1920), // Ajuste a data inicial conforme necessário
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              // Formata a data para exibir no campo e para enviar para a API
              String displayDate = DateFormat('dd/MM/yyyy').format(pickedDate);
              String apiFormattedDate =
                  DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss'Z'").format(pickedDate);

              controller.dataNascimento.text = displayDate;
              attributes.value = apiFormattedDate;
              attributes.changed = true; // Marca como alterado
            }
            controller.update();
          },
          child: AbsorbPointer(
            child: ComplexTextInput(
              textCampo:
                  attributes.attribute?.viewatributoProdutoId?.capitalize ?? '',
              isSecret: false,
              textEditingController: controller.dataNascimento,
              keyboardType: TextInputType.none,
              hintText: Strings.hint_value_data,
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: '##/##/####',
                  filter: {"#": RegExp(r'[0-9]')},
                ),
              ],
              onChanged: (String text) {
                try {
                  DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(text);
                  attributes.value = DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss'Z'")
                      .format(parsedDate);
                  attributes.changed = true;
                } catch (e) {
                  // Handle parsing error
                }
              },
            ),
          ),
        ),
      );

    case "Tabela":
      return Visibility(
        visible: attributes.visible == false
            ? controller.evaluateCondition(attributes.sentence!)
            : true,
        child: attributes.attribute!.viewescolha == "UnicaEscolha"
            ? DropdownCustomDynamicFormField(
                list: uniqueItems.obs, // Lista de opções
                title:
                    attributes.attribute!.viewatributoProdutoId!.capitalize ??
                        '',
                getLabel: (value) =>
                    value.name!.capitalize ?? '', // Função para mostrar o nome
                onSelected: (value) {
                  // Atualizar o valor selecionado e marcar como alterado
                  attributes.value = value.id;
                  attributes.changed = true;
                  controller.update();
                },
                // Se o valor já foi preenchido, use o item correspondente
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione uma opção';
                  }
                  return null;
                },
              )
            : MultiSelectDropdown(
                list: attributes.attribute!.opcoes!.obs,
                title:
                    attributes.attribute!.viewatributoProdutoId!.capitalize ??
                        '',
                getLabel: (value) => value.name?.capitalize ?? '',
                selectedItems: controller.selectedMultiItems,
                onSelected: (selectedItems) {
                  attributes.value = selectedItems;
                  attributes.changed = true;
                  controller.update();
                },
              ),
      );

    case "Dinheiro":
      return Visibility(
        visible: attributes.visible == false
            ? controller.evaluateCondition(attributes.sentence!)
            : true,
        child: ComplexTextInput(
          textCampo:
              attributes.attribute?.viewatributoProdutoId?.capitalize ?? '',
          isSecret: false,
          initialValue: attributes.attribute?.valor != null
              ? "R\$ ${currencyFormat.format(double.tryParse(attributes.attribute!.valor!) ?? 0)}"
              : '', // Converte valor inicial para moeda com "R$"
          keyboardType: TextInputType.datetime,
          hintText: 'Informe o valor',
          inputFormatters: [
            MoneyInputFormatter(
              leadingSymbol: 'R\$',
              thousandSeparator: ThousandSeparator.Period,
              mantissaLength: 2, // Número de casas decimais
            ),
          ],
          validator: Validatorless.required('Insira o valor'),
          onChanged: (value) {
            // Remove "R$" e pontos de milhar para salvar apenas números com duas casas decimais
            attributes.value = value
                .replaceAll('R\$', '')
                .replaceAll('.', '')
                .replaceAll(',', '.')
                .trim();
            attributes.changed = true;
          },
        ),
      );

    case "Texto":
    case "SwitchInput":
      return Visibility(
        visible: attributes.visible == false
            ? controller.evaluateCondition(attributes.sentence!)
            : true,
        child: attributes.attribute!.viewatributoProdutoId!.contains('CEP')
            ? ComplexTextInput(
                validator: Validatorless.required('Insira o valor'),
                textCampo:
                    attributes.attribute?.viewatributoProdutoId?.capitalize ??
                        '',
                hintText: attributes.attribute?.viewatributoProdutoId,
                onChanged: (text) {
                  attributes.value = text;
                  attributes.changed = true;
                },
                inputFormatters: [
                    attributes.attribute!.viewatributoProdutoId!.contains('CEP')
                        ? MaskTextInputFormatter(
                            mask: '##.###-###',
                            filter: {"#": RegExp(r'[0-9]')},
                          )
                        : MaskTextInputFormatter()
                  ])
            : ComplexTextInput(
                validator: Validatorless.required('Insira o valor'),
                textCampo: attributes
                        .attribute?.viewatributoProdutoId?.capitalizeFirst ??
                    '',
                hintText: attributes.attribute?.viewatributoProdutoId,
                onChanged: (text) {
                  attributes.value = text;
                  attributes.changed = true;
                },
                inputFormatters: [
                    attributes.attribute!.viewatributoProdutoId!.contains('CEP')
                        ? MaskTextInputFormatter(
                            mask: '##.###-###',
                            filter: {"#": RegExp(r'[0-9]')},
                          )
                        : MaskTextInputFormatter()
                  ]),
      );
    case "Boolean":
      return Visibility(
        visible: attributes.name!.contains("AVERBADA")
            ? true
            : attributes.visible == false
                ? controller.evaluateCondition(attributes.sentence!)
                : true,
        child: DropdownCustomDynamicFormField(
          list: controller.listBool!, // Lista de opções
          title: attributes.attribute!.viewatributoProdutoId!.capitalize ?? '',
          getLabel: (value) =>
              value.name!.capitalize ?? '', // Função para mostrar o nome
          onSelected: (value) {
            // Atualizar o valor selecionado e marcar como alterado
            attributes.value = value.id;
            funcao!(value.id!);
            attributes.changed = true;
            controller.update();
          },
          // Se o valor já foi preenchido, use o item correspondente
          validator: (value) {
            if (value == null) {
              return 'Por favor, selecione uma opção';
            }
            return null;
          },
        ),
      );

    case "Percentual":
      return Visibility(
        visible: attributes.visible == false
            ? controller.evaluateCondition(attributes.sentence!)
            : true,
        child: ComplexTextInput(
          suffixIcon: Icons.percent,
          textCampo:
              attributes.attribute?.viewatributoProdutoId?.capitalize ?? '',
          hintText: attributes.attribute?.viewatributoProdutoId,
          onChanged: (value) {
            attributes.value = value;
            attributes.changed = true;
          },
          validator: Validatorless.required('Insira o valor'),
        ),
      );
    case "AutoComplete":
      return Visibility(
          visible: attributes.visible == false
              ? controller.evaluateCondition(attributes.sentence!)
              : true,
          child: AutocompleteCustom(
            attributeDTO: attributes,
            textCampo:
                attributes.attribute?.viewatributoProdutoId?.capitalize ?? '',
            option: controller.municipio,
          ));
    default:
      return const TextField();
  }
}

  // ///aqui vai jogar o setence e verificar se a condicao é true ou false
  // bool evaluateCondition(String sentence) {
  //   // Substitua as variáveis na condição pelo valor do contexto
  //   for (var entry in constantsMap.entries) {
  //     sentence = sentence.replaceAll('{${entry.key}}', entry.value.toString());
  //   }

  //   // Avaliação simplificada para igualdade
  //   if (sentence.contains('==')) {
  //     var parts = sentence.split('==');
  //     var left = parts[0].trim();
  //     var right = parts[1].trim();
  //     return left == right;
  //   } else {
  //     return false; // Se nenhuma condição for atendida, retorna falso
  //   }
  // }