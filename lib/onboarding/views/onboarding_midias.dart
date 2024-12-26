// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/Strings/strings.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/onboarding/components/card_index.dart';
import 'package:bkopen/onboarding/controlllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../app/components/button/bkopen_button.dart';

class OnboardingMidias extends StatefulWidget {
  final RxBool isAceppt = false.obs;
  OnboardingMidias({
    super.key,
  });

  @override
  State<OnboardingMidias> createState() => _OnboardingMidiasState();
}

class _OnboardingMidiasState extends State<OnboardingMidias>
    with WidgetsBindingObserver {
  final controller = Get.find<OnboardingController>();
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Inicializar o VideoPlayerController
    _videoController =
        VideoPlayerController.network(controller.listVideos.value)
          ..initialize().then((_) {
            setState(() {});
            _videoController!.play(); // Começa a reprodução automática
          });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _videoController?.dispose(); // Libera os recursos ao descartar a tela
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _videoController
          ?.pause(); // Pausa o vídeo quando o app vai para o background
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(shrinkWrap: true, children: [
              CardIndex(
                i: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Saiba mais sobre as nossas funcionalidades',
                style: Styles.h2,
                textAlign: TextAlign.center,
              ),
              BKOpenSpacing.x16,
              SizedBox(
                width: Get.width,
                height: Get.height * 0.3,
                child: _videoController != null &&
                        _videoController!.value.isInitialized
                    ? VideoPlayer(_videoController!)
                    : Center(
                        child:
                            CircularProgressIndicator()), // Mostra um loading enquanto carrega o vídeo
              ),
              BKOpenSpacing.x48,
              Column(
                children: [
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Checkbox(
                                activeColor: BKOpenColors.secondary,
                                value: controller.doNotShowAgain.value,
                                onChanged: (value) {
                                  controller.doNotShowAgain.value = value!;
                                }),
                            const Text(
                              Strings.video_view,
                            )
                          ],
                        ),
                      )),
                  BKOpenSpacing.x16,
                  BKOpenButton(
                      text: "Finalizar",
                      imageRight: const Icon(Icons.check_circle_outlined,
                          color: Colors.white, size: 16),
                      onTap: () {
                        _videoController?.pause();
                        controller.finishedOnboarding();
                      }),
                  BKOpenSpacing.x16,
                ],
              ),
            ])),
      ),
    );
  }
}
