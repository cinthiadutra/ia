import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/components/utils/formatter_class.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/text_inputs/complex_text_input.dart';
import 'package:bkopen/onboarding/controlllers/onboarding_controller.dart';
import 'package:bkopen/onboarding/components/card_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../../app/theme/styles.dart';

class OnboardingDoc extends StatefulWidget {
  const OnboardingDoc({
    super.key,
  });

  @override
  State<OnboardingDoc> createState() => _OnboardingDocState();
}

class _OnboardingDocState extends State<OnboardingDoc> {
  final controller = Get.find<OnboardingController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isDocEmpty = true.obs;

  @override
  void initState() {
    super.initState();

    // Escuta mudanças no campo de texto
    controller.doc.addListener(() {
      isDocEmpty.value = controller.doc.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          child: Form(
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const CardIndex(
                  i: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  Strings.need_your_doc_body,
                  style: Styles.h2,
                  textAlign: TextAlign.center,
                )),
                BKOpenSpacing.x16,
                Container(
                  height: Get.height * 0.23,
                  width: Get.width * 0.8,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/png/onboarding4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                BKOpenSpacing.x16,
                Text(
                  Strings.t_lorem,
                  style: Styles.bodyText,
                  textAlign: TextAlign.start,
                ),
                BKOpenSpacing.x16,
                ComplexTextInput.without(
                  textEditingController: controller.doc,
                  keyboardType: TextInputType.datetime,
                  maxLenght: 14,
                  hintText: Strings.insert_doc,
                  validator: Validatorless.multiple([
                    Validatorless.required('Insira seu Documento'),
                    Validatorless.min(11, 'Insira um Documento válido'),
                    Validatorless.cpf('Insira um Documento válido')
                  ]),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter()
                  ],
                ),
                BKOpenSpacing.x16,
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Obx(() => BKOpenButton(
                            backgroundColor: isDocEmpty.value
                                ? BKOpenColors.primary.withOpacity(0.6)
                                : BKOpenColors.primary,
                            text: "Proximo",
                            imageRight: const Icon(
                              Icons.login_rounded,
                              color: Colors.white,
                            ),
                            imagePadding: 10,
                            onTap: () {
                              if (formKey.currentState?.validate() ?? false) {
                                controller.sendDocument();
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
      ),
    );
  }
}
