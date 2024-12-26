import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/AppPages.dart';
import '../../theme/bkopencolors.dart';
import '../../theme/styles.dart';

class BKAppBarNotification extends StatelessWidget {
  final String title;

  const BKAppBarNotification({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: SizedBox(
        height: 40,
        child: Stack(
          children: [
            // Botão de voltar
            Positioned(
              left: 0,
              child: TextButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new_rounded,
                    size: 13, color: BKOpenColors.secondary),
                label: Text('Voltar', style: Styles.helperText),
              ),
            ),
            // Título centralizado no topo
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    top:
                        8.0), // Adicionando padding para ajustar o posicionamento
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    title,
                    style: Styles.h3Strong,
                  ),
                ),
              ),
            ),

            Positioned(
              right: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    top:
                        8.0), // Adicionando padding para ajustar o posicionamento
                child: Align(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(PageRoutes.notificationsettingspage);
                      },
                      child: Icon(Icons.settings_outlined,
                          size: 20, color: BKOpenColors.highlight),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
