// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class ProposalSendSucess extends StatefulWidget {
  const ProposalSendSucess({super.key});

  @override
  State<ProposalSendSucess> createState() => _ProposalSendSucessState();
}

class _ProposalSendSucessState extends State<ProposalSendSucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            BKOpenSpacing.x64,
            Container(
              width: 48,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SvgPicture.asset(
                                      "assets/images/svg/new_releases.svg",
                        
                color: BKOpenColors.highlight,
              ),
            ),
            BKOpenSpacing.x24,
            Text("Proposta concluída\ncom sucesso!",style: Styles.h2,textAlign: TextAlign.center,),
            BKOpenSpacing.x24,
            Center(child: Text("Mensagem falando sobre a\n proposta aceita e o contrato.",style: Styles.bodyText,textAlign: TextAlign.center, maxLines: 2,)),

            
        ],),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  BKOpenButton(text: "Minhas propostas",imageRight: Icon(Icons.description_outlined,color: Colors.white,size: 18),onTap: (){
                  Get.offAndToNamed(PageRoutes.profileproposalandcontractspage);
                },),
                BKOpenSpacing.x16,
                BKOpenButton.outline(text: "Inicio",
                backgroundColor: BKOpenColors.white,
                textColor: BKOpenColors.primary,
                borderColor: BKOpenColors.primary,
                widthBorder: 2,
                imageRight: Icon(Icons.home_outlined,color: BKOpenColors.highlight,size: 18,),onTap: (){
                  Get.offAndToNamed(PageRoutes.homepage);

                },),
                ],
              )),
        )
      );
  }
}
