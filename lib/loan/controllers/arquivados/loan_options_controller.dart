// import 'dart:async';

// import 'package:get/get.dart';

// import '../../app/utils/curency_text_input_mask.dart';

// class LoanOptionsController extends GetxController{

//   RxBool isLoading = true.obs;

//   RxBool obscureText = true.obs;

//   RxInt currentPage = 0.obs;

//   RxString amountString = "".obs;
//   RxDouble amountDouble = 0.0.obs;
//   CurrencyTextInputMaskController edtControllerAmount =
//   CurrencyTextInputMaskController();

//   RxBool SelectPersonPFOrPJ = true.obs;

//   RxBool isFirstCardSelected = true.obs;


//   RxBool isFirstSelected = false.obs;
//   RxBool isSecondSelected = false.obs;
//   RxBool isThirdSelected = false.obs;
//   RxBool isFourthSelected = false.obs;
//   RxBool isFifthSelected = false.obs;

//   RxBool  isPF = true.obs;

//   RxInt selectedIndex = 1.obs; // Índice do item selecionado, -1 se nenhum estiver selecionado

//  RxString title = ''.obs;

//   RxList<String> listItemsPF = [
//     'Pessoal',
//     'Home',
//     'Home Equity',
//     'Auto Equity',
//     'Equity',
//     'Saque Antecipado FGTS',
//   ].obs;

//   RxList<String> listItemsPJ = [
//     'Auto Equity',
//     'Home Equity',
//     'Desconto de duplicatas',
//     'Garantia de duplicatas',
//     'Garantia de máquinas e equipamentos',

//   ].obs;

//   RxList listSelectedItems = [].obs;

//   void setFirstSelected(bool value) => isFirstSelected.value = value;
//   void setSecondSelected(bool value) => isSecondSelected.value = value;
//   void setThirdSelected(bool value) => isThirdSelected.value = value;
//   void setFourthSelected(bool value) => isFourthSelected.value = value;
//   void setFifthSelected(bool value) => isFifthSelected.value = value;

//   @override
//   void onInit() {
//     // TODO: implement onInit

//     isFirstSelected.value  = false;
//     isSecondSelected.value = false;
//     isThirdSelected.value  = false;
//     isFourthSelected.value = false;
//     isFifthSelected.value  = false;


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