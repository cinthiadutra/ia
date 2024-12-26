import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/onboarding/components/card_index.dart';
import 'package:bkopen/onboarding/controlllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/widgets/textTerms/text_terms.dart';

class OnboardingTerms extends StatefulWidget {
  OnboardingTerms({super.key});
  final RxBool isAceppt = false.obs;

  @override
  State<OnboardingTerms> createState() => _OnboardingTermsState();
}

class _OnboardingTermsState extends State<OnboardingTerms> {
  var controller = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              BKOpenSpacing.x16,
              const CardIndex(
                i: 3,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Leia os nossos Termos de Uso",
                  style: Styles.h2,
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                    side: const BorderSide(
                        color: BKOpenColors.borderGrey, width: 1),
                  ),
                  child: Scrollbar(
                    trackVisibility: true,
                    interactive: true,
                    thickness: 5,
                    child: ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: [
                        TextTerms(body: Strings.terms_bk),
                        SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Obx(() => Row(
                  children: [
                    Checkbox(
                        activeColor: BKOpenColors.secondary,
                        value: widget.isAceppt.value,
                        onChanged: (value) {
                          widget.isAceppt.value = value!;
                        }),
                    const Text(
                      Strings.terms_accepted,
                    )
                  ],
                )),
            BKOpenSpacing.x8,
            Obx(() => BKOpenButton(
                  enabled: widget.isAceppt.value,
                  text: "Próximo",
                  imageRight: const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                  ),
                  imagePadding: 10,
                  onTap: () {
                    controller.acceptedTermsOfUser();
                  },
                )),
            BKOpenSpacing.x16,
          ],
        ),
      ),
    );
  }
}
