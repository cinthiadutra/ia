import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/button/bkopen_button.dart';
import '../app/routes/AppPages.dart';
import '../app/theme/styles.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
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
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  BKOpenSpacing.x16,
                  Text(
                    "Leia os nossos Termos de Uso",
                    style: Styles.h2,
                  ),
                  BKOpenSpacing.x16,
                  Text(Strings.terms_bk),
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
