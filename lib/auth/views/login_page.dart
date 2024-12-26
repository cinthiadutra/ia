import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/assets/bkopen_assets.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:validatorless/validatorless.dart';
import '../../app/Strings/strings.dart';
import '../../app/routes/AppPages.dart';
import '../../app/theme/styles.dart';
import '../../app/widgets/text_inputs/complex_text_input.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();

  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _getAppVersion();
  }

  Future<void> _getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = "${packageInfo.version} (${packageInfo.buildNumber})";
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return SafeArea(
        child: PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          BkopenAssets.logosvg,
                          alignment: Alignment.center,
                        ),
                      ),
                      BKOpenSpacing.x24,
                      Text(Strings.login,
                          style: Styles.h3Strong
                              .copyWith(color: BKOpenColors.primary)),
                      BKOpenSpacing.x24,
                      ComplexTextInput.without(
                        isSecret: false,
                        textEditingController: controller.username,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        hintText: Strings.hint_type_your_email,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onChanged: (String text) {},
                        validator: Validatorless.multiple([
                          Validatorless.email("O Email não é válido"),
                          Validatorless.required("Insira um email")
                        ]),
                      ),
                      ComplexTextInput.without(
                        isSecret: true,
                        textEditingController: controller.password,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        hintText: Strings.hint_password,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onChanged: (String text) {},
                        validator: Validatorless.multiple(
                            [Validatorless.required("Insira uma senha")]),
                      ),
                      BKOpenSpacing.x16,
                      TextButton(
                        child: Text(
                          Strings.hint_recovery_password,
                          style: Styles.textUnderline
                              .copyWith(color: BKOpenColors.secondary),
                        ),
                        onPressed: () {
                          Get.toNamed(
                            PageRoutes.recoverypasswordemail,
                          );
                        },
                      ),
                    ]),
                    Column(
                      children: [
                        SizedBox(
                            child: BKOpenButton(
                          text: "Entrar",
                          imageRight: Icon(
                            Icons.login_rounded,
                            color: Colors.white,
                          ),
                          onTap: () async {
                            if (formKey.currentState?.validate() ?? true) {
                              await controller.signIn();
                            }
                          },
                        )),
                        BKOpenSpacing.x16,
                        BKOpenButton.home(
                          text: "Novo cadastro",
                          imageLeft: Icon(
                            Icons.person_add_alt,
                            color: Colors.white,
                          ),
                          imagePadding: 10,
                          onTap: () {
                            Get.toNamed(PageRoutes.registerpage);
                          },
                        ),
                        BKOpenSpacing.x16,
                        SizedBox(
                          height: Get.height / 4,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'Versão do app: $appVersion',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}
