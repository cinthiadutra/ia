// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/components/button/bkopen_button.dart';
import '../../app/routes/AppPages.dart';


class RecoveryPasswordSuccess extends StatelessWidget {

  const RecoveryPasswordSuccess({ super.key });


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BKOpenSpacing.x48,
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      "assets/images/svg/privacy_tip.svg",
                      width: 58,
                      height: 58,
                      color: BKOpenColors.highlight,
                    ),
                  ),
                  BKOpenSpacing.x24,
                  Text(
                    "Senha alterada com sucesso!",
                    style: Styles.h3Strong.copyWith(color: BKOpenColors.primary),
                  ),
                  BKOpenSpacing.x24,
                  Text(
                    "Volte para o login e acesse a plataforma com sua nova senha.",
                    style: Styles.bodyText,
                    textAlign: TextAlign.center,
                  ),
                 
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: double.infinity,
                child:  BKOpenButton(
                    text: "Login",
                    imageRight: Icon(Icons.login_outlined, color: Colors.white),
                    onTap: (){
                      Get.offAndToNamed(PageRoutes.loginpage);
                    },
                  ),),
          ),
        ),
      ),
    );
  }
}
