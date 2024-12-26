//import 'package:bkopen/proposal_pending%20%20/controllers/proposal_against_atualization_option_controller.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/loan/components/upload_photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/components/button/bkopen_button.dart';
import '../../../app/routes/AppPages.dart';
import '../../../app/spacing/bkopen_spacing.dart';
import '../../../app/theme/styles.dart';
import '../../../app/widgets/text_inputs/complex_text_input.dart';
import '../../controllers/proposal_against_controller.dart';

class ProposalAgainstAtualizationUploadPage
    extends GetView<ProposalAgainstController> {
  const ProposalAgainstAtualizationUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Home Equity"),
        body: Obx(() {
       
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BKOpenSpacing.x24,
                          BKOpenSpacing.x24,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pendências",
                                style: Styles.h3Strong.copyWith(fontSize: 16),
                              ),
                              Icon(
                                Icons.help_outline_outlined,
                                size: 24,
                                color: BKOpenColors.highlight,
                              )
                            ],
                          ),
                          BKOpenSpacing.x16,
                          Text(
                            "Mensagem falando sobre as pendências e como resolvê-las. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
                            style: Styles.helperText
                                .copyWith(color: BKOpenColors.blackSub),
                          ),
                          BKOpenSpacing.x8,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: UploadPhoto(isPendent: true,),
                          ),
                          BKOpenSpacing.x24,
                          ComplexTextInput(
                            isSecret: false,
                            //labelText: Strings.label_phone,
                            // focusNode: controller.phoneFocusNode,
                            //     textEditingController:controller.edtControllerAmount,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            hintText: "Informação",
                            onChanged: (String text) {
                              //       controller.amountString.value = controller.edtControllerAmount.text;
                              //        controller.amountDouble.value = controller.edtControllerAmount.doubleValue;
                            },
                          ),
                          ComplexTextInput(
                            isSecret: false,
                            //labelText: Strings.label_phone,
                            // focusNode: controller.phoneFocusNode,
                            //   textEditingController:controller.edtControllerAmount,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            hintText: "Informação",
                            onChanged: (String text) {
                              //     controller.amountString.value = controller.edtControllerAmount.text;
                              //     controller.amountDouble.value = controller.edtControllerAmount.doubleValue;
                            },
                          ),
                        ],
                      ),
                     
                    ],
                  ),
                ],
              ),
            );
          
        }),
    
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                 BKOpenSpacing.x16,
                            BKOpenButton.outline(
                                backgroundColor: BKOpenColors.white,
                                borderColor: BKOpenColors.primary,
                                textColor: BKOpenColors.primary,
                                text: "Enviar novos dados",
                                imageRight: Icon(
                                  Icons.upload,
                                  size: 22,
                                  color: BKOpenColors.highlight,
                                ),
                                onTap: () {
                                  Get.offAndToNamed(
                                    PageRoutes.loanvaluesolicitedpage,
                                  );
                                }),
                            BKOpenSpacing.x16,
                            BKOpenButton(
                              text: "Chat",
                              imageRight: Icon(Icons.chat,
                                  color: Colors.white, size: 16),
                              onTap: () {
                                Get.offAndToNamed(
                                  PageRoutes
                                      .proposalagainstatualizationchatpage,
                                );
                              },
                            ),
                ],
              )),
        ),
    ));
  }
}
