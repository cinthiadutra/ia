import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class CardMenu extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<Color>? cor;
  final Color? corTexto;



  const CardMenu({super.key, required this.label, required this.icon, this.cor, this.corTexto});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(39),
          gradient: LinearGradient(
              colors: cor?? [BKOpenColors.primary, BKOpenColors.secondary]),
          border: Border.all(color: BKOpenColors.secondary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            maxLines: 1,
            label,
            style: Styles.labelStatusText.copyWith(
                color:corTexto?? BKOpenColors.white,
                ),
          ),
          Icon(
            icon,
            color:corTexto?? BKOpenColors.white,
            size: 20,
          ),
        ],
      ),
    );
  }
}
