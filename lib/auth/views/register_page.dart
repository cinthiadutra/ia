import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/auth/components/info_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/theme/styles.dart';
import '../../app/widgets/text_inputs/complex_text_input.dart';
import '../controllers/login_controller.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(
          label: Strings.label_register,
        ),
        body: Obx(() {

          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BKOpenSpacing.x16,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        Strings.alert_body_register,
                        style: Styles.bodyText,
                      ),
                    ),
                    BKOpenSpacing.x8,
                    ComplexTextInput.without(
                      isSecret: false,
                      textEditingController: controller.name,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                      hintText: Strings.hint_type_your_name,
                      inputFormatters: [],
                      onChanged: (String text) {},
                      validator: Validatorless.multiple([
                        Validatorless.min(7, 'Insira um nome Válido'),
                        Validatorless.required('Insira seu nome')
                      ]),
                    ),
                    ComplexTextInput.without(
                      isSecret: false,
                      textEditingController: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      hintText: Strings.hint_email,
                      inputFormatters: [],
                      onChanged: (String text) {},
                      validator: Validatorless.multiple([
                        Validatorless.email(Strings.validationEmailInvalid),
                        Validatorless.required(Strings.validationEmailEmpty)
                      ]),
                    ),
                    ComplexTextInput.without(
                      obscureText: controller.obscureText.value,
                      isSecret: true,
                      textEditingController: controller.passwordCreate,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hintText: Strings.hint_password,
                      onChanged: (String text) {
                        controller.validatePassword(text);
                      },
                      validator: Validatorless.multiple([
                        Validatorless.required(Strings.validationPasswordEmpty),
                        controller.validateSecurePassword,
                      ]),
                    ),
                    ComplexTextInput.without(
                      isSecret: true,
                      obscureText: controller.obscureText.value,
                      textEditingController: controller.passwordRepeat,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      hintText: Strings.hint_repeat_password,
                      inputFormatters: [],
                      onChanged: (String text) {
                        controller.validatePassword(text);
                      },
                      validator: Validatorless.multiple([
                        Validatorless.compare(controller.passwordCreate,
                            Strings.error_password_confirmation),
                        Validatorless.required(Strings.validationPasswordEmpty),
                        controller.validateSecurePassword,
                      ]),
                    ),
                    BKOpenSpacing.x8,
                   InfoCard(),
                    BKOpenSpacing.x8,
                  ],
                ),
              ),
            ),
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: BKOpenButton(
                  enabled: true,
                  text: "Próximo",
                  imageRight: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  imagePadding: 10,
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      await controller.signUp();
                      controller.recoveryPassword = 'register';
                    }
                  })),
        ),
      ),
    );
  }
}
