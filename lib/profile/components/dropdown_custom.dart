import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DropdownCustom<T> extends StatefulWidget {
  final RxList<T> list;
  final TextEditingController selected;
  final String title;
  final String Function(T) getLabel;
  final Function(T)? onSelected; // Tornar o onSelected opcional

  const DropdownCustom({
    super.key,
    required this.list,
    required this.selected,
    required this.title,
    required this.getLabel,
    this.onSelected, // Recebe a função opcional de callback
  });

  @override
  State<DropdownCustom<T>> createState() => _DropdownCustomState<T>();
}

class _DropdownCustomState<T> extends State<DropdownCustom<T>> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Styles.textForm,
        ),
        BKOpenSpacing.x8,
        DropdownMenu<T>(
          enableFilter: false,
          width: Get.width,
          initialSelection: widget.list.first,
          controller: widget.selected,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: Styles.textInput,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: BKOpenColors.borderGrey,
              ),
            ),
          ),
          onSelected: (T? value) {
            if (value != null && widget.onSelected != null) {
              widget.onSelected!(value); // Chamar o callback se disponível
            }
          },
          dropdownMenuEntries: widget.list.map<DropdownMenuEntry<T>>((T value) {
            return DropdownMenuEntry<T>(
              value: value,
              label: widget.getLabel(value),
            );
          }).toList().obs,
        ),
      ],
    );
  }
}
