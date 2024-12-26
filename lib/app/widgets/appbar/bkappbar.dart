import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/styles.dart';

class BKAppBar extends AppBar {
  final String label;
  final bool estaNahome;
  final IconData? icone;
  BKAppBar({
    super.key,
    required this.label,
    this.estaNahome = false,
    this.icone,
  }) : super(
          leadingWidth: MediaQuery.of(Get.context!).size.width * 0.25,
          automaticallyImplyLeading: estaNahome ? false : true,
          centerTitle: icone == null ? true : false,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              estaNahome ? Get.offAndToNamed(PageRoutes.homepage) : Get.back();
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
