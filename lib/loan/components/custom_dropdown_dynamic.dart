// ignore_for_file: library_private_types_in_public_api

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items;
  final RxList<T> selectedItems; // Lista reativa de itens selecionados
  final String title;
  final String Function(T) getLabel;
  final Function(T) onTap; // Função chamada quando um item é clicado
  final String textCampo;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.title,
    required this.getLabel,
    required this.onTap,
    required this.textCampo,
  });

  @override
  _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    // Atualiza o título dinamicamente com base nos itens selecionados
    String selectedTitle = widget.selectedItems.isEmpty
        ? 'Selecione uma ou mais opções' // Mensagem padrão
        : widget.selectedItems
            .map((item) => widget.getLabel(item))
            .join(', '); // Junta os nomes dos itens selecionados

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textCampo,
          style: Styles.textForm,
        ),
        BKOpenSpacing.x8,
        GestureDetector(
          onTap: () {
            setState(() {
              _isDropdownOpen = !_isDropdownOpen; // Alterna a visibilidade
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedTitle, // Exibe o título selecionado ou a mensagem padrão
                  style: const TextStyle(fontSize: 16),
                ),
                Icon(
                  _isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        if (_isDropdownOpen)
          Material(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                height: 150, // Ajuste para o tamanho da lista
                child: Obx(() {
                  return ListView(
                    children: widget.items.map((item) {
                      return CheckboxListTile(
                        title: Text(widget.getLabel(item)),
                        value: widget.selectedItems.contains(item),
                        onChanged: (_) {
                          widget.onTap(
                              item); // Chama a função onTap para atualizar a seleção
                        },
                      );
                    }).toList(),
                  );
                }),
              ),
            ),
          ),
      ],
    );
  }
}
