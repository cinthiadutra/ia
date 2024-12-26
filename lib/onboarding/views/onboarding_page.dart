import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/onboarding/controlllers/onboarding_controller.dart';
import 'package:bkopen/onboarding/components/card_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/styles.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = Get.find<OnboardingController>();
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
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(shrinkWrap: true, children: [
            BKOpenSpacing.x24,
            const CardIndex(
              i: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            BKOpenSpacing.x8,
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Center(
                    child: Text(
                      Strings.welcome,
                      style: Styles.h2,
                    ),
                  ),
                  BKOpenSpacing.x24,
                  Container(
                    height: Get.height * 0.25,
                    width: Get.width * 0.88,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/png/onboarding1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  BKOpenSpacing.x24,
                  Text(
                    Strings.body_onboarding,
                    style: Styles.bodyText,
                    textAlign: TextAlign.justify,
                  ),
                  BKOpenSpacing.x48vertical,
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, bottom: 16),
                    child: SizedBox(
                      child: BKOpenButton(
                        text: "Começar",
                        imageRight: const Icon(
                          Icons.flag_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        imagePadding: 10,
                        onTap: () {
                          Get.toNamed(PageRoutes.onboardingpagephone);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
