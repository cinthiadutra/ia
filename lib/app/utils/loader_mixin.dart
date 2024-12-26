// ignore_for_file: deprecated_member_use

import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading, RxString message) {
    everAll([loading, message], (_) {
      final isLoading = loading.value;
      final loadingMessage = message.value;

      if (isLoading) {
        // Executa após o ciclo atual de construção
        Future.microtask(() {
          if (Get.isDialogOpen != true) {
            Get.dialog(
              Center(
                child: Material(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        const SizedBox(height: 16),
                        Text(
                          loadingMessage.isEmpty
                              ? 'Aguarde... estamos processando a sua solicitação'
                              : loadingMessage,
                          style: Styles.buttonLabel,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              barrierDismissible: false,
            );
          }
        });
      } else {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      }
    });
  }
}
