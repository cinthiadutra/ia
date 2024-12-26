import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/theme/styles.dart';
import '../../app/widgets/text_inputs/complex_text_input.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  var controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: BKAppBar(
            label: Strings.label_authentication,
          ),
          body: Obx(() {
            return Form(
              key: formKey,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(shrinkWrap: true, children: <Widget>[
                    BKOpenSpacing.x24,
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        Strings.label_instruction_authenticating,
                        style: Styles.labelText
                            .copyWith(color: BKOpenColors.blackSub),
                      ),
                    ),
                    BKOpenSpacing.x16,
                    ComplexTextInput.without(
                      isSecret: false,
                      //labelText: Strings.label_phone,
                      // focusNode: controller.phoneFocusNode,
                      textEditingController: controller.codeAuthentic,
                      keyboardType: TextInputType.datetime,

                      maxLenght: 6,
                      hintText: Strings.hint_code_authentication,
                      inputFormatters: [],
                      onChanged: (String text) {},
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            'Insira o código que foi enviado por email'),
                        Validatorless.min(6, 'Seu código contem 6 numeros')
                      ]),
                    ),

                    BKOpenSpacing.x24,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                          width: double.infinity,
                          child: BKOpenButton(
                              text: "Confirmar",
                              imagePadding: 10,
                              onTap: () {
                                if (formKey.currentState?.validate() ?? true) {
                                  if (controller.recoveryPassword ==
                                      "recovery") {
                                    controller.validatePasswordResetCode();
                                    controller.codeAuthentic.clear();
                                  } else {
                                    controller.validateCode();
                                    controller.codeAuthentic.clear();
                                  }
                                }
                              })),
                    ),
                    // Obx(() => controller.isButtonVisible.value
                    //     ? TextButton(
                    //         onPressed: () {
                    //           controller.sendCode();

                    //           AlertDialog(
                    //               content: Text(
                    //                   'O código foi reenviado, Confira sem email',
                    //                   style: Styles.textUnderline.copyWith(
                    //                       color: BKOpenColors.primary)));
                    //         },
                    //         child: Text(Strings.hint_resend_code,
                    //             style: Styles.textUnderline
                    //                 .copyWith(color: BKOpenColors.secondary)))
                    //     : SizedBox()),

                    Center(
                      child: Text(
                        controller.isButtonVisible.value
                            ? ''
                            : '${Strings.instruction_authentication}${controller.resendCountdown.value}s',
                        style: Styles.textDetails
                            .copyWith(color: BKOpenColors.lightGrey),
                      ),
                    ), // Texto abaixo da linha
                    BKOpenSpacing.x24,
                  ])),
            );
          }),
        ),
      ),
    );
  }
}
