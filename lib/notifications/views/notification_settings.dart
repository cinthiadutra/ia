import 'dart:developer';

import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/theme/styles.dart';
import '../controllers/notification_settings_controller.dart';
import '../components/custom_switch.dart';


class NotificationSettingsPage extends GetView<NotificationSettingsController> {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Notificações"),
        body: Obx(
              () {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                shrinkWrap: true,

                children: <Widget>[
                  BKOpenSpacing.x24,
                
                  BKOpenSpacing.x16,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text("Receber notificações no celular",style: Styles.labelText,),
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Novas propostas',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Novos contratos',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Pendências',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Novidades e promoções',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),



                  BKOpenSpacing.x24,
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                    child: Text("Receber notificações por e-mail",style: Styles.labelText.copyWith(fontWeight: FontWeight.w500),),
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Novas propostas',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Novos contratos',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Pendências',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Comunicações',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                  BKOpenSpacing.x8,
                  CustomSwitch(
                    text: 'Novidades e promoções',
                    initialValue: false,
                    onChanged: (value) {
                      // Faça alguma lógica aqui com o valor do switch
                      log('O switch foi alterado para: $value');
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}


