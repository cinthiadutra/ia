import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCard extends StatelessWidget {
  final controller = Get.find<LoginController>();

   InfoCard({ super.key });

   @override
   Widget build(BuildContext context) {
       return   Card(
                      color:
                          BKOpenColors.backgroudMedium2, // Cor, de fundo cinza
                      elevation: 0, // Sem elevação
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/png/encrypted.png',
                              scale: 4,
                              color: BKOpenColors.highlight,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Text(
                                          "1 - Senha deve conter ao menos 6 caracteres.",
                                          style: TextStyle(
                                              color:
                                                  controller.hasMinLength.value
                                                      ? Colors.green
                                                      : Colors.red),
                                        )),
                                    Obx(() => Text(
                                          "2 - Senha deve conter caracteres especiais.",
                                          style: TextStyle(
                                              color: controller
                                                      .hasSpecialCharacter.value
                                                  ? Colors.green
                                                  : Colors.red),
                                        )),
                                    Obx(() => Text(
                                          "3 - Senha deve conter letras maiúsculas.",
                                          style: TextStyle(
                                              color:
                                                  controller.hasUpperCase.value
                                                      ? Colors.green
                                                      : Colors.red),
                                        )),
                                    Obx(() => Text(
                                          "4 - Senha deve conter números.",
                                          style: TextStyle(
                                              color: controller.hasNumbers.value
                                                  ? Colors.green
                                                  : Colors.red),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}