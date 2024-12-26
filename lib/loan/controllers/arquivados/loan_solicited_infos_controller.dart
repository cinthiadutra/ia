// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../app/utils/curency_text_input_mask.dart';

// class LoanSolicitedInfosController extends GetxController{

//   RxBool isLoading = true.obs;

//   RxBool obscureText = true.obs;

//   RxInt currentPage = 0.obs;

//   RxString amountString = "".obs;
//   RxDouble amountDouble = 0.0.obs;
//   CurrencyTextInputMaskController edtControllerAmount =
//   CurrencyTextInputMaskController();
// TextEditingController valorTotal = TextEditingController();
// TextEditingController info1 = TextEditingController();

// TextEditingController info2 = TextEditingController();


//   @override
//   void onInit() {
//     // TODO: implement onInit


//     Timer(Duration(seconds: 3),(){
//        isLoading.value = false;
//     });
//     super.onInit();

//   }

//  bool  getValueObscureText() {

//     if(obscureText.value == true){
//       obscureText.value = false;
//     }else {
//       obscureText.value = true;
//     }

//     return obscureText.value;
//  }
// }