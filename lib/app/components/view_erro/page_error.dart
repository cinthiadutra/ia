import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/AppPages.dart';

class PageError extends StatelessWidget {
  const PageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BKOpenSpacing.x24,
          SvgPicture.asset('assets/images/svg/error.svg'),
          BKOpenSpacing.x24,
          Text(
            'Ops.. Algo deu errado!',
            style: Styles.h2,
          ),
          BKOpenSpacing.x24,
          Text(
            'Mensagem falando sobre o erro que ocorreu',
            style: Styles.bodyText,
          ),
          BKOpenSpacing.x40,
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: BKOpenButton.white(
                textColor: BKOpenColors.primary,
                borderColor: BKOpenColors.primary,
                text: "Inicio",
                imageRight:
                    Icon(Icons.home_outlined, color: BKOpenColors.highlight),
                onTap: () {
                  Get.offAndToNamed(PageRoutes.loginpage);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
