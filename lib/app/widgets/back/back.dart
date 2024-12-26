import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/bkopencolors.dart';
import '../../theme/styles.dart';

class Back extends StatelessWidget {
  final String title;
  const Back({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton.icon(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 13,
            color: BKOpenColors.secondary,
          ),
          label: Text(
            'Voltar',
            style: Styles.buttonLabel,
          ),
        ),
      ],
    );
  }
}
