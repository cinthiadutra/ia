import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/styles.dart';

class BKAppBarJornada extends AppBar {
  final String label;
  final bool isEtapaDesejo;
  final IconData? icone;
  final VoidCallback rota;

  BKAppBarJornada({
    super.key,
    required this.label,
    this.isEtapaDesejo = false,
    this.icone,
    required this.rota,
  }) : super(
          leadingWidth: MediaQuery.of(Get.context!).size.width * 0.25,
          automaticallyImplyLeading: isEtapaDesejo ? false : true,
          centerTitle: icone == null ? true : false,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              isEtapaDesejo ? Get.offAllNamed(PageRoutes.homepage) : rota;
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left_outlined,
                    color: BKOpenColors.secondary,
                  ),
                  Visibility(
                      visible: icone == null,
                      child: Text(
                        'Voltar',
                        style: Styles.buttonLabel,
                      ))
                ],
              ),
            ),
          ),
          title: icone == null
              ? Text(
                  label,
                  style: Styles.h3Strong,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icone,
                      color: BKOpenColors.highlight,
                    ),
                    Text(
                      label,
                      style: Styles.h3Strong,
                    ),
                  ],
                ),
        );
}
