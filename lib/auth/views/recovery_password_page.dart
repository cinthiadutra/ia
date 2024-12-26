import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/auth/components/button_confirm_password.dart';
import 'package:bkopen/auth/components/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/widgets/text_inputs/complex_text_input.dart';
import '../controllers/login_controller.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class RecoveryPasswordPage extends StatelessWidget {
  final controller = Get.find<LoginController>();

   RecoveryPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: BKAppBar(label: "Alterar senha", estaNahome: true,),
        body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  BKOpenSpacing.x24,
                  ComplexTextInput.without(
                    isSecret: true,
                    textEditingController: controller.passwordCreate,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.go,
                    hintText: Strings.hint_new_password,
                    onChanged: (String text) {
                      controller.validatePassword(text);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    validator: Validatorless.multiple([
                      Validatorless.required(Strings.validationPasswordEmpty),
                    ]),
                  ),
                  ComplexTextInput.without(
                    isSecret: true,
                    textEditingController: controller.passwordRepeat,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hintText: Strings.hint_new__repeat_password,
                    onChanged: (String text) {
                      controller.validatePassword(text);
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    validator: Validatorless.multiple([
                      Validatorless.compare(controller.passwordCreate,
                          Strings.error_password_confirmation),
                      Validatorless.required(Strings.validationPasswordEmpty),
                    ]),
                  ),
                  BKOpenSpacing.x24,
                  InfoCard()
                ],
              ),
            )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: ButtonConfirmPassword(
                  text: "Atualizar senha",
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.changePassword();
                    }
                  })),
        ),
      ),
    );
  }
}
