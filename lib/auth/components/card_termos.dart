import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTermos extends StatefulWidget {
  const CardTermos({super.key});

  @override
  State<CardTermos> createState() => _CardTermosState();
}

class _CardTermosState extends State<CardTermos> {
  

  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Obx(() => Checkbox(
            side: BorderSide(color: BKOpenColors.borderGrey),
              value: controller.isAcceptTerms.value,
              onChanged: (value) {
                controller.isAcceptTerms.value = value!;
              })),
          InkWell(
            child: Text(
              "Termos de uso",
              style: Styles.textUnderline.copyWith(fontSize: 12),
            ),
            onTap: () {
              controller.toggleCheckboxTerms(context);
            },
          ),
        ],
      ),
    );
  }
}
