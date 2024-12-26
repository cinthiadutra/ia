import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/Strings/strings.dart';
import '../../app/routes/AppPages.dart';
import '../controllers/init_controller.dart';
import '../components/screen.dart';

class InitPage extends StatelessWidget {
  final initController = Get.find<InitController>();

  InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(children: [
          PageView(
            controller: initController.pageController,
            onPageChanged: (index) {
              initController.currentPage.value = index;
            },
            children: [
              Screen(
                image: 'assets/images/png/1.jpg',
                title: Strings.title_init2,
              ),
              Screen(
                image: 'assets/images/png/2.jpg',
                title: Strings.title_init1,
              ),
              Screen(
                image: 'assets/images/png/3.jpg',
                title: Strings.title_init3,
              ),
              Screen(
                image: 'assets/images/png/4.jpg',
                title: Strings.title_init5,
              ),
              Screen(
                image: 'assets/images/png/5.jpg',
                title: Strings.title_init4,
              ),
            ],
          ),
          Positioned(
            top: Get.height / 20,
            left: 15,
            right: 15,
            child: SizedBox(
              height: 30,
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      initController.pageCount,
                      (index) => GestureDetector(
                        onTap: () {
                          initController.changePage(
                              index); // Trocar página ao clicar no indicador
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Container(
                            width: Get.width / 7,
                            height: 6,
                            decoration: BoxDecoration(
                              color: index == initController.currentPage.value
                                  ? BKOpenColors.highlight
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .75,
            left: 15,
            right: 15,
            child: Column(
              children: [
                BKOpenButton(
                  text: "Login",
                  imageRight: Icon(
                    Icons.login_rounded,
                    color: Colors.white,
                  ),
                  imagePadding: 10,
                  onTap: () {
                    Get.toNamed(PageRoutes.loginpage);
                  },
                ),
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
                InkWell(
                    onTap: () {
                      Get.toNamed(PageRoutes.terms);
                    },
                    child: Text("Termos de uso",
                        style: Styles.textUnderline.copyWith(
                            color: BKOpenColors.white01.withOpacity(0.7)))),
                InkWell(
                    onTap: () {
                      Get.toNamed(PageRoutes.politica);
                    },
                    child: Text("Politica de privacidade",
                        style: Styles.textUnderline.copyWith(
                            color: BKOpenColors.white01.withOpacity(0.7))))
              ],
            ),
          ),
        ]));
  }
}
