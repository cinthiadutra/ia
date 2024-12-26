import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class InfoCardRose extends StatelessWidget {
  const InfoCardRose({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: BKOpenColors.highlight.withOpacity(.15), // Cor, de fundo cinza
      elevation: 0, // Sem elevação
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: BKOpenColors.highlight,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 8), // Espaçamento horizontal
                    Text(
                      Strings.alert_register2,
                      style:
                          Styles.labelText.copyWith(color: BKOpenColors.alert2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
