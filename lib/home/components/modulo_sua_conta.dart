import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/home/components/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModuloSuaConta extends StatelessWidget {
  const ModuloSuaConta({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          BKOpenSpacing.x16,
          Text("Sua conta",
              style:
                  Styles.buttonLabel.copyWith(color: BKOpenColors.titleHome)),
          BKOpenSpacing.x8,
          CustomCard(
            text: 'Perfil',
            urlImage: "assets/images/svg/account_circle.svg",
            backgroundColor: Colors.grey[300]!,
            widthBorder: 1,
            onTap: () {
              Get.toNamed(PageRoutes.profilepage);
            },
          ),
          CustomCard(
            text: 'Configurações da conta',
            urlImage: "assets/images/svg/settings.svg",
            backgroundColor: Colors.grey[300]!,
            widthBorder: 1,
            onTap: () {},
          ),
          CustomCard(
            text: 'Central de ajuda',
            urlImage: "assets/images/svg/help.svg",
            widthBorder: 1,
            backgroundColor: Colors.grey[300]!,
            onTap: () {
              Get.toNamed(PageRoutes.pageerror);
            },
          ),
        ],
      ),
    );
  }
}
