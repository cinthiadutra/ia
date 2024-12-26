import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/onboarding/components/card_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/theme/bkopencolors.dart';
import '../../app/widgets/text_inputs/complex_text_input.dart';
import '../controlllers/onboarding_controller.dart';

class OnboardingConfirm extends StatefulWidget {
  const OnboardingConfirm({super.key});

  @override
  State<OnboardingConfirm> createState() => _OnboardingConfirmState();
}

class _OnboardingConfirmState extends State<OnboardingConfirm> {
  Rx<bool> showCode = Rx(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isCodeEmpty = true.obs;

  @override
  void initState() {
    super.initState();
    controller.code.addListener(() {
      isCodeEmpty.value = controller.code.text.isEmpty;
    });
    Future.delayed(const Duration(seconds: 20), () {
      showCode.value = true;
    });
  }

  var controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
        child: ListView(
          shrinkWrap: true,
          children: [
            const CardIndex(
              i: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              Strings.confirm_number,
              style: Styles.h2,
            )),
            BKOpenSpacing.x16,
            Container(
              height: Get.height * 0.23,
              width: Get.width * 0.8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/images/png/onboarding3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BKOpenSpacing.x16,
            const Text(Strings.info_verify_profile_for_sms_validation),
            BKOpenSpacing.x16,
            ComplexTextInput.without(
              textEditingController: controller.code,
              hintText: 'insira o código recebido',
              maxLenght: 6,
              keyboardType: TextInputType.datetime,
              textInputAction: TextInputAction.next,
              validator: Validatorless.multiple([
                Validatorless.required('Insira o código recebido'),
                Validatorless.min(4, 'Insira o código recebido valido'),
              ]),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            BKOpenSpacing.x8,
            Obx(() => Visibility(
                visible: showCode.value,
                child: TextButton(
                    onPressed: () {
                      controller.isSendAgainSms.value = true;
                      controller.sendSms();
                      controller.code.clear();
                      showCode.value = false;

                      Future.delayed(const Duration(seconds: 20), () {
                        showCode.value = true;
                      });
                    },
                    child: const Text(
                      "Enviar novo Código",
                      style: Styles.textUnderline,
                    )))),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Obx(() => BKOpenButton(
                          backgroundColor: isCodeEmpty.value
                              ? BKOpenColors.primary.withOpacity(0.4)
                              : BKOpenColors.primary,
                          text: "Confirmar código",
                          imageRight: const Icon(
                            Icons.chevron_right_outlined,
                            color: Colors.white,
                          ),
                          imagePadding: 10,
                          onTap: () {
                            if (formKey.currentState?.validate() ?? true) {
                              controller.validateCode();
                            }
                          },
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
