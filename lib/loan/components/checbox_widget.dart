// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';

class CheckboxWidget extends StatelessWidget {

  final String text;
  final  bool isSelected;
  final ValueChanged<String> onSelected;
   const CheckboxWidget({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onSelected,
  });
   

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        border: Border.all(
            color:
                BKOpenColors.borderGrey), // Adiciona uma borda retangular fina
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style:
                  Styles.labelStatusText.copyWith(color: BKOpenColors.primary)),
          Checkbox(
                value: isSelected,
                fillColor:!isSelected
                    ? WidgetStatePropertyAll(BKOpenColors.checkBoxColor)
                    : WidgetStatePropertyAll(BKOpenColors.secondary),
                checkColor: BKOpenColors.white,
                activeColor: BKOpenColors.primary,
                focusColor: BKOpenColors.primary,
                hoverColor: BKOpenColors.primary,
                overlayColor: WidgetStatePropertyAll(BKOpenColors.secondary),
                side: BorderSide(color: Colors.transparent),
                onChanged: (newValue) {
                  if (newValue == true) {
                    onSelected.call(text);
                  }
                },
              ),
        ],
      ),
    );
  }
}
