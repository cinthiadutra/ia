import 'package:bkopen/app/core/data/we_socket_server.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/home/components/modulo_feito_pra_voce.dart';
import 'package:bkopen/home/components/modulo_sua_conta.dart';
import 'package:bkopen/home/components/pop_menu.dart';
import 'package:bkopen/home/controllers/home_controller.dart';
import 'package:bkopen/profile/components/perfil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app/navigation/mangos_nav_bar/view/components/bkopen_nav_bar_component.dart';
import '../../app/routes/AppPages.dart';
import '../../app/theme/styles.dart';
import '../components/modulo_ultima_proposta.dart';
import '../components/notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.find<HomeController>();
  final ws = Get.find<WebSocketService>();

  int currentIndex = 0;
  bool showModuloUltimaProposta = false; // Controla a exibição do widget

  @override
  void initState() {
    super.initState();
    controller.filterJornada();
    // Configura o delay para exibir o widget
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          showModuloUltimaProposta = true; // Atualiza o estado
        });
      }
    });
    controller.appController.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          BKOpenSpacing.x24,
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(PageRoutes.profilepage);
                                },
                                child: Perfil(
                                  name: controller.profileController
                                      .getIniciais(controller.profileController
                                          .appController.couser.value.name)
                                      .obs,
                                  isHome: true,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Buscar',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: BKOpenColors.borderGrey)),
                                      suffixIcon: Icon(Icons.search),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  showPopupMenu(context);
                                  ws.initConnection();
                                },
                                child: Notifications(
                                    notificationCount: controller
                                            .appController
                                            .messageAll
                                            .value
                                            
                                            .length),
                              ),
                            ],
                          ),
                          BKOpenSpacing.x24,
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 80,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items:
                                controller.getListBannersData().map((banner) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: Image.asset(banner.imagePath),
                                  );
                                },
                              );
                            }).toList(),
                          ),

                          BKOpenSpacing.x16,
                          Divider(color: BKOpenColors.accentGrey, thickness: 1),
                          controller.isLoading.value
                              ? SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : (showModuloUltimaProposta
                                  ? ModuloUltimaProposta()
                                  : SizedBox.shrink()), // Exibe após 5 segundos
                          Divider(color: BKOpenColors.accentGrey, thickness: 1),
                          BKOpenSpacing.x16,
                          Text("Feito para você",
                              style: Styles.buttonLabel
                                  .copyWith(color: BKOpenColors.titleHome)),
                          BKOpenSpacing.x16,
                        ],
                      ),
                    ),
                  ),
                  ModuloFeitoPraVoce(),
                  ModuloSuaConta()
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BKOpenNavbarComponent(),
      ),
    );
  }
}
