// ignore_for_file: dead_code

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bkopen/loan/data/models/options_list.dart';

class DropdownCustomDynamicFormField extends FormField<OptionsList> {
  DropdownCustomDynamicFormField({
    super.key,
    required RxList<OptionsList> list,
    required String title,
    required String Function(OptionsList) getLabel,
    Function(OptionsList)? onSelected,
    super.validator,
    OptionsList? value,
    bool autovalidateMode = false,
  }) : super(
          builder: (FormFieldState<OptionsList> state) {
            // Garantir que a lista seja única removendo duplicatas com base no ID
            final uniqueList = list
                .toSet() // Remove duplicatas com base no ID
                .toList();

            // Verificar se o valor inicial está na lista
            final initialValue = state.value ?? value;
            final isValidValue =
                uniqueList.any((option) => option.id == initialValue?.id);
            bool showError = false;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textForm,
                ),
                BKOpenSpacing.x8,
                InputDecorator(
                  baseStyle: Styles.textInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                    ),
                    contentPadding: EdgeInsets.only(left: 5),
                    errorText:
                        showError ? 'Por favor, selecione uma opção' : null,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<OptionsList>(
                      isExpanded: true,
                      // Garantir que o valor inicial seja atribuído corretamente, se presente
                      value: isValidValue ? initialValue : null,
                      hint: Text('Selecione uma opção'),
                      items: uniqueList.map((option) {
                        return DropdownMenuItem<OptionsList>(
                          value: option,
                          child: Text(getLabel(option)),
                        );
                      }).toList(),
                      onChanged: (OptionsList? selected) {
                        debugPrint(
                            'Selected: ${selected?.id}'); // Verificar se está capturando o valor
                        state.didChange(selected);
                        if (onSelected != null && selected != null) {
                          onSelected(selected);
                        }
                      },
                    ),
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      state.errorText ?? '',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                SizedBox(
                  height: 10,
                )
              ],
            );
          },
        );
}
