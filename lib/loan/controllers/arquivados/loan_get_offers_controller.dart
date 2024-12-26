import 'dart:async';

import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/utils/curency_text_input_mask.dart';
import 'package:get/get.dart';



class LoanGetOffersController extends GetxController{

  RxBool isLoading = false.obs;

  RxBool obscureText = true.obs;

  RxInt currentPage = 0.obs;

  RxString amountString = "".obs;
  RxDouble amountDouble = 0.0.obs;
  CurrencyTextInputMaskController edtControllerAmount =
  CurrencyTextInputMaskController();

  @override
  void onInit() {


    Timer(Duration(seconds: 7),(){
      Get.toNamed(PageRoutes.loanchooseofferspage);
    });
    super.onInit();

  }

 bool  getValueObscureText() {

    if(obscureText.value == true){
      obscureText.value = false;
    }else {
      obscureText.value = true;
    }

    return obscureText.value;
 }
}