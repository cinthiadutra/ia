import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class CardItemLista extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  final IconData icon;
  final Color backgroudCor;
  final Color textCor;
  final Color iconCor;
  final Color backgroudCor2;

  final Color bordercor;

  const CardItemLista(
      {super.key, required this.text,
       this.onTap,
       this.isSelected = true,
      required this.icon,

      this.backgroudCor = BKOpenColors.primary,
      this.backgroudCor2 = BKOpenColors.secondary,
      this.textCor = BKOpenColors.white,
      this.bordercor = BKOpenColors.transparent,
      this.iconCor = BKOpenColors.white});

  const CardItemLista.light(
      {super.key, required this.text,
       this.onTap,
       this.isSelected = true,
      required this.icon,
      this.backgroudCor = BKOpenColors.white,
      this.backgroudCor2 = BKOpenColors.white,
       this.textCor = BKOpenColors.primary,
       this.bordercor= BKOpenColors.secondary,
       this.iconCor = BKOpenColors.highlight});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [backgroudCor, backgroudCor2]),
          border: Border.all(color: bordercor),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: Styles.buttonLabel.copyWith(color: textCor)),
              Icon(
                icon,
                color: iconCor,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
