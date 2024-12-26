import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/components/utils/formatter_class.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/text_inputs/complex_text_input.dart';
import 'package:bkopen/onboarding/controlllers/onboarding_controller.dart';
import 'package:bkopen/onboarding/components/card_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/theme/styles.dart';

class OnboardingPhone extends StatefulWidget {
  const OnboardingPhone({
    super.key,
  });

  @override
  State<OnboardingPhone> createState() => _OnboardingPhoneState();
}

class _OnboardingPhoneState extends State<OnboardingPhone> {
  final controller = Get.find<OnboardingController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isPhoneEmpty = true.obs;

  @override
  void initState() {
    super.initState();

    // Escuta mudanças no campo de texto
    controller.phone.addListener(() {
      isPhoneEmpty.value = controller.phone.text.isEmpty;
    });
  }

  @override
  void dispose() {
    // Remove o listener ao sair da tela
    controller.phone.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const CardIndex(
                i: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                  child: Text(
                Strings.whats_number,
                style: Styles.h2,
              )),
              BKOpenSpacing.x16,
              Container(
                height: Get.height * 0.23,
                width: Get.width * 0.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage('assets/images/png/onboarding2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              BKOpenSpacing.x16,
              const Text(
                Strings.phone_onboarding,
                style: Styles.labelText,
                textAlign: TextAlign.start,
              ),
              BKOpenSpacing.x16,
              ComplexTextInput.without(
                hintText: Strings.number_cel,
                textEditingController: controller.phone,
                validator: Validatorless.multiple([
                  Validatorless.required('Insira um numero de telefone'),
                  Validatorless.min(13, 'Insira um numero de telefone válido'),
                  Validatorless.regex(
                      RegExp(r'^\(?[1-9]{2}\)? ?9[0-9]{4}-?[0-9]{4}$'),
                      'Insira um numero de telefone válido')
                ]),
                inputFormatters: [MobilePhoneNumberInputFormatter()],
                keyboardType: TextInputType.datetime,
                maxLenght: 14,
              ),
              BKOpenSpacing.x24,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Obx(() => BKOpenButton(
                          backgroundColor: isPhoneEmpty.value
                              ? BKOpenColors.primary.withOpacity(0.4)
                              : BKOpenColors.primary,
                          text: "Enviar SMS",
                          imageRight: const Icon(
                            Icons.forward_to_inbox_outlined,
                            color: Colors.white,
                          ),
                          imagePadding: 10,
                          onTap: () {
                            if (formKey.currentState?.validate() ?? true) {
                              controller.sendSms();
                            }
                          })),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
