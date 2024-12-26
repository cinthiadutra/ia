import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPolitica extends StatefulWidget {
  const CardPolitica({super.key});

  @override
  State<CardPolitica> createState() => _CardPoliticaState();
}

class _CardPoliticaState extends State<CardPolitica> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Obx(() => Checkbox(
            side: BorderSide(color: BKOpenColors.borderGrey),
              value: controller.isAcceptPolicy.value,
              onChanged: (value) {
                controller.isAcceptPolicy.value = value!;
              })),
          InkWell(
            child: Text(
              "Politica de Privacidade",
              style: Styles.textUnderline.copyWith(fontSize: 12),
            ),
            onTap: () {
              controller.toggleCheckboxPolicy(context);
            },
          ),
        ],
      ),
    );
  }
}
