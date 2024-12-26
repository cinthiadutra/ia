import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/routes/AppPages.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/app/widgets/text_inputs/complex_text_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../app/Strings/strings.dart';
import '../controllers/login_controller.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  var controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BKAppBar(
        label: Strings.label_authentication,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(Strings.insert_email,
                    style: Styles.labelStatusText
                        .copyWith(color: BKOpenColors.primary, fontSize: 16))),
            BKOpenSpacing.x8,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                Strings.insert_email_renew,
                style: Styles.labelText.copyWith(color: BKOpenColors.blackSub),
              ),
            ),
            BKOpenSpacing.x16,
            ComplexTextInput.without(
              isSecret: false,
              //labelText: Strings.label_phone,
              // focusNode: controller.phoneFocusNode,
              textEditingController: controller.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              hintText: Strings.hint_email,
              inputFormatters: [],
              onChanged: (String text) {},
              validator: Validatorless.multiple([
                Validatorless.required(
                    'Insira o seu email para envio do código'),
                Validatorless.email('Insira um email válido')
              ]),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                BKOpenButton(
                  text: "Continuar",
                  imageRight: Icon(Icons.arrow_forward_ios_outlined,
                      color: Colors.white, size: 16),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      controller.generatePasswordCode();
                    }
                  },
                ),
                BKOpenSpacing.x16,
                BKOpenButton.outline(
                  backgroundColor: BKOpenColors.white,
                  borderColor: BKOpenColors.primary,
                  textColor: BKOpenColors.primary,
                  text: "Voltar",
                  imageLeft: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 18,
                    color: BKOpenColors.highlight,
                  ),
                  imagePadding: 10,
                  onTap: () {
                    Get.offAndToNamed(
                      PageRoutes.loginpage,
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
