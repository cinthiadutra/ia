import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/options_list.dart';

class MultiSelectDropdown extends StatefulWidget {
  final RxList<OptionsList> list;
  final String title;
  final String Function(OptionsList) getLabel;
  final List<OptionsList>? selectedItems;
  final Function(dynamic)
      onSelected; // Alterado para enviar uma string com valores separados por vírgula

  const MultiSelectDropdown({
    super.key,
    required this.list,
    required this.title,
    required this.getLabel,
    this.selectedItems,
    required this.onSelected,
  });

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
  final RxList<OptionsList> _selectedItems = <OptionsList>[].obs;

  @override
  void initState() {
    super.initState();
    // Inicializa _selectedItems se houver itens selecionados passados
    if (widget.selectedItems != null) {
      _selectedItems.addAll(widget.selectedItems!);
    }
  }

  void _updateSelection(bool? isChecked, OptionsList? option) {
    if (option == null) return;

    if (isChecked == true) {
      if (!_selectedItems.contains(option)) {
        _selectedItems.add(option);
      }
    } else {
      _selectedItems.remove(option);
    }

    // Verifica o número de itens selecionados e monta a string apropriada
    String selectedValues;
    if (_selectedItems.length == 1) {
      // Apenas um item selecionado, envia o id dele como string
      selectedValues = _selectedItems.first.id?.toString() ?? '';
    } else {
      // Mais de um item selecionado, envia ids separados por vírgula
      selectedValues = _selectedItems
          .map((item) => item.id?.toString())
          .where(
              (id) => id != null && id.isNotEmpty) // Remove IDs nulos ou vazios
          .join(', ');
    }

    // Envia a string gerada para onSelected
    widget.onSelected(selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Styles.textForm,
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              contentPadding: EdgeInsets.only(left: 5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<OptionsList>(
                isExpanded: true,
                hint: Obx(() {
                  // Exibe o texto correto para seleção única ou múltipla
                  final selectedLabels = _selectedItems
                      .map(widget.getLabel)
                      .where((label) => label.isNotEmpty)
                      .join(", ");
                  return Text(
                    selectedLabels.isEmpty
                        ? "Selecione uma opção"
                        : selectedLabels,
                    style: TextStyle(fontSize: 16),
                  );
                }),
                items: widget.list.map((option) {
                  return DropdownMenuItem<OptionsList>(
                    key: UniqueKey(),
                    value: option,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.getLabel(option)),
                        Obx(() => Checkbox(
                              value: _selectedItems.contains(option),
                              onChanged: (isChecked) =>
                                  _updateSelection(isChecked, option),
                            )),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
