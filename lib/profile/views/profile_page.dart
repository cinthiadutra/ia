import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/widgets/appbar/bkappbar.dart';
import 'package:bkopen/profile/components/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/routes/AppPages.dart';
import '../../app/theme/styles.dart';
import '../controllers/profile_controller.dart';
import '../components/custom_card.dart';
import '../components/perfil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BKAppBar(
          label: 'Perfil',
        ),
        body: Obx(
          () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.pickFile();
                      },
                      child: Perfil(
                        isHome: false,
                        name: controller.getIniciais(controller
                                .appController.couser.value.name)
                            .obs,
                        showPencilIcon: true,
                      )),
                  BKOpenSpacing.x8,
                  Text(
                    controller.appController.couser.value.name!
                            .capitalize ??
                        '',
                    style: Styles.h3Strong
                        .copyWith(fontSize: 16, color: BKOpenColors.blackSub),
                  ),
                  BKOpenSpacing.x24,
                  Obx(() => ProfileWidget(
                        isValidadEmail: controller.appController.couser
                                    .value.emailValidated ==
                                null
                            ? false
                            : true,
                        isValidadPhone: controller.appController.couser
                                    .value.phoneValidated ==
                                null
                            ? false
                            : true,
                        phoneNumber: controller
                                .appController.couser.value.cellPhone ??
                            '',
                        email: controller
                                .appController.couser.value.email ??
                            '',
                        doc: controller.appController.couser.value
                                .legalDocument ??
                            '',
                        birthDate: controller
                                .appController.couser.value.birth ??
                            '-',
                        name:
                            controller.appController.couser.value.name ??
                                '-',
                        lastName: controller
                                .appController.couser.value.lastName ??
                            '-',
                        pais: controller.appController.couser.value
                                    .coCultureId ==
                                1
                            ? 'Brasil'
                            : '-'
                                '-',
                      )),
                  BKOpenSpacing.x16,
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CustomCard(
              text: 'Alterar senha',
              urlImage: "assets/images/svg/lock_reset.svg",
              backgroundColor: BKOpenColors.white,
              color: BKOpenColors.primary,
              colorImage: BKOpenColors.highlight,
              colorBorda: BKOpenColors.primary,
              onTap: () {
                Get.toNamed(PageRoutes.recoverypasswordprofilepage);
              },
            ),
            CustomCard(
              text: 'Atualizar cadastro',
              urlImage: "assets/images/svg/person_edit.svg",
              backgroundColor: BKOpenColors.primary,
              onTap: () {
                Get.toNamed(PageRoutes.profileeditpage);
              },
              color: BKOpenColors.white,
              colorImage: BKOpenColors.white,
            ),
            BKOpenSpacing.x24vertical
          ],
        ),
      ),
    );
  }
}
