// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/loan/controllers/loan_proposal_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:bkopen/app/theme/bkopencolors.dart';

import '../../app/routes/AppPages.dart';
import '../controllers/home_controller.dart';

class MenuCard extends StatelessWidget {
  late int index;
  final homeController = Get.find<HomeController>();
  final loanController = Get.find<LoanProposalController>();

  MenuCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => homeController.toggleSelected(index),
      child: Obx(
        () => GestureDetector(
          onTap: () => getRote(index),
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                  gradient: index == 7
                      ? LinearGradient(colors: [Colors.white, Colors.white60])
                      : index == 0
                          ? LinearGradient(colors: [
                              BKOpenColors.primary,
                              BKOpenColors.secondary
                            ])
                          : LinearGradient(colors: [
                              BKOpenColors.primary.withOpacity(0.3),
                              BKOpenColors.secondary.withOpacity(0.3)
                            ]),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: index == 0 || index == 7
                          ? BKOpenColors.primary
                          : Colors.transparent)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0, top: 10.0),
                      child: getIcon(index,
                          color: index == 7
                              ? BKOpenColors.highlight
                              : Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                      child: Text(
                        getTitle(index),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.start,
                        style: Styles.labelStatusText.copyWith(
                          color:
                              homeController.isSelectedList[index] || index == 7
                                  ? BKOpenColors.primary
                                  : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SvgPicture getIcon(int index, {required Color color}) {
    switch (index) {
      case 0:
        return SvgPicture.asset(
          "assets/images/svg/handshake.svg",
          color: color,
          width: 24,
          height: 24,
        );
      case 1:
        return SvgPicture.asset(
          "assets/images/svg/car_tag.svg",
          color: color,
          width: 24,
          height: 24,
        );
      case 2:
        return SvgPicture.asset(
          "assets/images/svg/account_balance_wallet.svg",
          color: color,
          width: 24,
          height: 24,
        );
      case 3:
        return SvgPicture.asset(
          "assets/images/svg/finance_mode.svg",
          color: color,
          width: 24,
          height: 24,
        );
      case 4:
        return SvgPicture.asset(
          "assets/images/svg/cardiology.svg",
          color: color,
          width: 28,
          height: 28,
        );
      case 5:
        return SvgPicture.asset(
          "assets/images/svg/shield_person.svg",
          color: color,
          width: 24,
          height: 28,
        );
      case 6:
        return SvgPicture.asset(
          "assets/images/svg/pending.svg",
          color: color,
          width: 24,
          height: 24,
        );
      case 7:
        return SvgPicture.asset(
          "assets/images/svg/edit_document.svg",
          color: color,
          width: 24,
          height: 24,
        );
      default:
        return SvgPicture.asset(
          "",
          color: color,
          width: 24,
          height: 24,
        );
    }
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'Empréstimos';
      case 1:
        return 'Consórcios';
      case 2:
        return 'Financiamentos';
      case 3:
        return 'Investimentos';
      case 4:
        return 'Plano de Saúde';
      case 5:
        return 'Seguros';
      case 6:
        return 'Outros';
      case 7:
        return 'Propostas e\n Contratos';
      default:
        return '';
    }
  }

  Set<Future<dynamic>> getRote(int index) {
    switch (index) {
      case 0:
        return {loanController.insertJornada()};
      case 1:
        return {_showComingSoonDialog()};
      case 2:
        return {_showComingSoonDialog()};
      case 3:
        return {_showComingSoonDialog()};
      case 4:
        return {_showComingSoonDialog()};
      case 5:
        return {_showComingSoonDialog()};
      case 6:
        return {_showComingSoonDialog()};
      case 7:
        return {
          
          Get.offAndToNamed(PageRoutes.profileproposalandcontractspage)!};
      default:
        return {_showComingSoonDialog()};
    }
  }

  Future<void> _showComingSoonDialog() async {
    await Get.dialog(
      AlertDialog(
        title: Text(
          'Em breve',
          style: TextStyle(
              color: BKOpenColors.primary, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Esse novo produto estará disponível para você em breve!',
          style: TextStyle(color: BKOpenColors.secondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'OK',
              style: TextStyle(color: BKOpenColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
