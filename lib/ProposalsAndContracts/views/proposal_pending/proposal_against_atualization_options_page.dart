//import 'package:bkopen/proposal_pending%20%20/controllers/proposal_against_atualization_option_controller.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/text_inputs/complex_text_input.dart';
import 'package:bkopen/loan/components/upload_photo.dart';
import 'package:bkopen/ProposalsAndContracts/controllers/proposal_against_controller.dart';
import 'package:bkopen/loan/components/upload_photo_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../app/components/button/bkopen_button.dart';
import '../../../app/routes/AppPages.dart';
import '../../../app/spacing/bkopen_spacing.dart';
import '../../../app/theme/styles.dart';

class ProposalAgainstAtualizationOptionsPage
    extends GetView<ProposalAgainstController> {
  const ProposalAgainstAtualizationOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(label: "Home Equity"),
        body: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                BKOpenSpacing.x8,
                BKOpenSpacing.x16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Resolver pendências",
                      style: Styles.h3Strong.copyWith(fontSize: 16),
                    ),
                    Icon(
                      Icons.help_outline_outlined,
                      size: 24,
                      color: BKOpenColors.highlight,
                    )
                  ],
                ),
                BKOpenSpacing.x8,
                BKOpenSpacing.x16,
                Obx(() => UploadPhoto(
                      title: 'RG Frente',
                      isPendent: controller.isPendent.value,
                    )),
                BKOpenSpacing.x16,
                Obx(() => UploadPhoto2(
                      title: 'RG Verso',
                      isPendent: controller.isPendent.value,
                    )),
                BKOpenSpacing.x16,
                ComplexTextInput(
                  textCampo: 'Data de Emissão',
                  isSecret: false,

                  //labelText: Strings.label_phone,
                  // focusNode: controller.phoneFocusNode,
                  // textEditingController:controller,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                  hintText: 'Informação',
                  inputFormatters: [
                    MaskTextInputFormatter(
                      mask: '##/##/####',
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy,
                    )
                  ],
                  onChanged: (String text) {},
                ),
                BKOpenSpacing.x8,
                ComplexTextInput(
                  textCampo: 'Orgão Emissor',
                  isSecret: false,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.done,
                  hintText: 'Informação',
                  onChanged: (String text) {},
                ),
                BKOpenSpacing.x8,
              ],
            ),
          );
        }),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
              width: double.infinity,
              child: BKOpenButton(
                text: "Atualizar dados",
                imageRight: Icon(
                  Icons.edit_document,
                  size: 18,
                  color: BKOpenColors.white,
                ),
                onTap: () {
                  Get.offAndToNamed(
                    PageRoutes.pendencyproposalSendpage,
                  );
                },
              )),
        ),
      ),
    );
  }
}
