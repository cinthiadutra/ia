import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/Strings/strings.dart';
import '../app/components/button/bkopen_button.dart';
import '../app/routes/AppPages.dart';
import '../app/theme/styles.dart';

class Politica extends StatefulWidget {
  const Politica({super.key});

  @override
  State<Politica> createState() => _PoliticaState();
}

class _PoliticaState extends State<Politica> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              side: BorderSide(color: BKOpenColors.accentGrey1, width: 1),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: ListView(
                shrinkWrap: true,
                children: [
                  BKOpenSpacing.x16,
                  Text(
                    "Política de Privacidade",
                    style: Styles.h2Strong,
                  ),
                  BKOpenSpacing.x16,
                  Text(
                    Strings.politica_bk,
                    style: Styles.bodyText,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BKOpenButton.outline(
            widthBorder: 2,
            backgroundColor: BKOpenColors.white,
            borderColor: BKOpenColors.highlight,
            text: "Voltar",
            imageLeft: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: BKOpenColors.highlight,
            ),
            imagePadding: 10,
            textColor: BKOpenColors.highlight,
            onTap: () {
              Get.toNamed(PageRoutes.initpage);
            },
          ),
        ),
      ),
    );
  }
}
