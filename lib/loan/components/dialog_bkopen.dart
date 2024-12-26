
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showBKCustomDialog(ProposalAgainstController controller,bool isPendent, VoidCallback func) {
  Get.dialog(
    barrierDismissible: false,
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30), // espaço para o botão de fechar
                
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 2,
                  backgroundColor: BKOpenColors.primary,
                ),SizedBox(width: 5,),
                Text('Instrução de envio'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 2,
                  backgroundColor: BKOpenColors.primary,
                ),SizedBox(width: 5,),
                Text('Instrução de envio'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 2,
                  backgroundColor: BKOpenColors.primary,
                ),
                SizedBox(width: 5,),
                Text('Instrução de envio'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 2,
                  backgroundColor: BKOpenColors.primary,
                ),SizedBox(width: 5,),
                Text('Instrução de envio'),
              ],
            ),
            SizedBox(
              height: 5,
            ),]),
                SizedBox(height: 20),
                BKOpenButton(
            height: 40,
              text: "Enviar foto/arquivo",
              backgroundColor: BKOpenColors.secondary,
              onTap: () {
                Get.back();

                func();
                
              }),
              ],
            ),
          ), Positioned(
            top: 15.0,
            left: 15.0,
            child: Text(
                  'Como enviar seu documento',
                  style: Styles.h4.copyWith(color: BKOpenColors.secondary),
                ),),
          Positioned(
            top: 15.0,
            right: 15.0,
            child: GestureDetector(
              onTap: () {
                Get.back(); // Fecha o diálogo
              },
              child: Icon(
                Icons.close,
                size: 20.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

