// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/routes/AppPages.dart';

class LoanProposalSend extends StatefulWidget {
  const LoanProposalSend({super.key});

  @override
  State<LoanProposalSend> createState() => _LoanProposalSendState();
}

class _LoanProposalSendState extends State<LoanProposalSend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              BKOpenSpacing.x64,
              Container(
                width: 48,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SvgPicture.asset(
                  "assets/images/svg/approval_delegation.svg",
                  height: 40,
                  color: BKOpenColors.highlight,
                ),
              ),
              BKOpenSpacing.x24,
              Text(
                "Proposta enviada!",
                style: Styles.h2,
              ),
              BKOpenSpacing.x24,
              Text("Mensagem falando da proposta \nenviada com sucesso.",
                  style: Styles.bodyText)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                BKOpenButton(
                  text: "Minhas propostas",
                  imageRight: Icon(Icons.description_outlined,
                      color: Colors.white, size: 18),
                  onTap: () {
                    Get.offAndToNamed(
                        PageRoutes.profileproposalandcontractspage);
                  },
                ),
                BKOpenSpacing.x16,
                BKOpenButton.outline(
                  text: "Inicio",
                  backgroundColor: BKOpenColors.white,
                  textColor: BKOpenColors.primary,
                  borderColor: BKOpenColors.primary,
                  widthBorder: 2,
                  imageRight: Icon(
                    Icons.home_outlined,
                    color: BKOpenColors.highlight,
                    size: 18,
                  ),
                  onTap: () {
                    Get.offAndToNamed(PageRoutes.homepage);
                  },
                ),
              ],
            )),
      ),
    );
  }
}
