import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/auth/components/button_confirm_password.dart';
import 'package:bkopen/auth/components/info_card.dart';
import 'package:bkopen/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/theme/styles.dart';
import '../../app/widgets/text_inputs/complex_text_input.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class RecoveryPasswordProfilePage extends StatelessWidget {
  final controller = Get.find<ProfileController>();

 RecoveryPasswordProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: BKAppBar(label: "Perfil"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: [
                    BKOpenSpacing.x24,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Alterar senha",
                        style: Styles.buttonLabel
                            .copyWith(color: BKOpenColors.blackSub),
                      ),
                    ),
                    BKOpenSpacing.x16,
                    ComplexTextInput.without(
                      textEditingController: controller.passwordOld,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hintText: "Senha atual",
                      validator: Validatorless.multiple(
                          [Validatorless.required('Insira sua senha atual')]),
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      onChanged: (String text) {},
                    ),
                    ComplexTextInput.without(
                      textEditingController: controller.passwordCreate,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hintText: Strings.hint_new_password,
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      validator: Validatorless.multiple([
                        controller.validateSecurePassword,
                        Validatorless.required('Insira sua nova senha')
                      ]),
                      onChanged: (String text) {
                        controller.validatePassword(text);
                      },
                    ),
                    ComplexTextInput.without(
                      textEditingController: controller.passwordRepeat,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hintText: Strings.hint_new__repeat_password,
                      validator: Validatorless.multiple([
                        controller.validateSecurePassword,
                        Validatorless.required('Repita sua nova senha')
                      ]),
                      onChanged: (String text) {
                        controller.validatePassword(text);
                      },
                    ),
                    BKOpenSpacing.x24,
                    InfoCard()
                  ],
                )),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
                width: double.infinity,
                child: ButtonConfirmPassword(
                    text: "Atualizar senha",
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? true) {
                        controller.changePasswordInternal();
                      }
                    })),
          ),
        ),
      ),
    );
  }
}
