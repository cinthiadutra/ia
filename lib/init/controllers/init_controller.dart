import 'dart:async';
import 'dart:developer';

import 'package:bkopen/loan/components/terms_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  RxBool isLoading = true.obs;

  RxBool obscureText = true.obs;

  final currentPage = 0.obs;

  var pageController = PageController();

  final int pageCount = 5;

  @override
  void onInit() {
    super.onInit();
    pageController.dispose();
    pageController = PageController();
    startPageChangeTimer();
  }

  bool getValueObscureText() {
    if (obscureText.value == true) {
      obscureText.value = false;
    } else {
      obscureText.value = true;
    }

    return obscureText.value;
  }
void startPageChangeTimer() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (currentPage.value < pageCount - 1) {
        changePage(currentPage.value + 1);
      } else {
        changePage(0); // Voltar para a primeira página
      }
    });
  });
}


 void changePage(int index) {
  if (pageController.hasClients) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage.value = index;
  } else {
    log('PageController não está associado a nenhuma ScrollView no momento.');
  }
}


  void viewTerms(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TermsDialog(
          url: 'https://bkopen.com/terms-of-use',
          title: 'Termos de uso',
        );
      },
    );
  }

  void viewPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TermsDialog(
          url: 'https://bkopen.com/privacy-policy',
          title: 'Politica de privacidade',
        );
      },
    );
  }

  @override
  void onClose() {
    pageController.dispose(); // Certifique-se de descartar o controller
    super.onClose();
  }
}
