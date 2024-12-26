import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/home/controllers/home_controller.dart';
import 'package:bkopen/menu/components/card_menu_lista.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<HomeController> {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BKAppBar(
          label: "Menu",
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text('Produtos',
                  style: Styles.labelStatusText
                      .copyWith(color: BKOpenColors.titleHome)),
              BKOpenSpacing.x8,
              CardItemLista(
                  text: 'Empréstimos',
                  icon: Icons.handshake_outlined,
                  onTap: () {
                    Get.toNamed(PageRoutes.loanvaluesolicitedpage);
                  }),
              CardItemLista(
                text: 'Consórcios',
                icon: Icons.directions_car_filled,
              ),
              CardItemLista(
                  text: 'Financiamentos',
                  icon: Icons.account_balance_wallet_outlined,
                  onTap: () {}),
              CardItemLista(
                  text: 'Investimentos',
                  icon: Icons.bar_chart_outlined,
                  onTap: () {}),
              CardItemLista(
                  text: 'Plano de Saúde',
                  icon: Icons.monitor_heart_outlined,
                  onTap: () {}),
              CardItemLista(
                  text: 'Seguros', icon: Icons.policy_outlined, onTap: () {}),
              CardItemLista(
                  text: 'Outros', icon: Icons.pending_outlined, onTap: () {}),
              CardItemLista.light(
                text: 'Promoções',
                icon: Icons.verified_outlined,
                onTap: () {},
                iconCor: BKOpenColors.primary,
              ),
              Divider(
                color: BKOpenColors.lightGrey,
              ),
              BKOpenSpacing.x8,
              Text('Sua conta',
                  style: Styles.labelStatusText
                      .copyWith(color: BKOpenColors.titleHome)),
              BKOpenSpacing.x8,
              CardItemLista.light(
                text: 'Proposta e contratos',
                onTap: () {
                  Get.toNamed(PageRoutes.profileproposalandcontractspage);
                },
                isSelected: false,
                icon: Icons.edit_document,
              ),
              CardItemLista.light(
                text: 'Perfil',
                onTap: () {
                  Get.toNamed(PageRoutes.profilepage);
                },
                isSelected: false,
                icon: Icons.account_circle_outlined,
              ),
              CardItemLista.light(
                  text: 'Dados adicionais',
                  onTap: () {},
                  isSelected: false,
                  icon: Icons.article_outlined),
              CardItemLista.light(
                text: 'Configuração de conta',
                onTap: () {
                  Get.toNamed(PageRoutes.notificationsettingspage);
                },
                isSelected: false,
                icon: Icons.settings_outlined,
              ),
              CardItemLista.light(
                text: 'Central de ajuda',
                onTap: () {
                  Get.toNamed(PageRoutes.proposalagainstatualizationchatpage);
                },
                isSelected: false,
                icon: Icons.help_outline,
              ),
              CardItemLista.light(
                  textCor: BKOpenColors.highlight,
                  text: "Sair",
                  onTap: () {
                    Get.offAllNamed(PageRoutes.loginpage);
                  },
                  bordercor: BKOpenColors.highlight,
                  icon: Icons.exit_to_app_outlined)
            ],
          ),
        ));
  }
}
