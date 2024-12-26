import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  const CardItem({super.key, required this.text, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: BKOpenColors.borderGreyLight),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(text,
                  maxLines: 2,
                  style: Styles.buttonLabel.copyWith(
                    color: BKOpenColors.primary,
                  )),
            ),
            Expanded(
              flex: 1,
              child: Checkbox(
                value: isSelected,
                onChanged: (bool? value) {
                  // O onChanged chama a função onTap que é responsável por atualizar o estado
                  onTap(); // Disparando a função onTap que foi passada
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
