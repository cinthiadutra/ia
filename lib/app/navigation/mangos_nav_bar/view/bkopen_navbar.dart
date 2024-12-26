import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../theme/bkopencolors.dart';
import '../controller/navbar_controller.dart';
import 'components/bkopen_navbar_button.dart';

class BKOpenNavbar extends GetView<NavBarController> {
  final int selectedIndex;
  final Function onTapHome;
  final Function onTapConfig;
  final Function onTapProfile;
  final Function onTapHelp;
  final Function onTapMenu;

  const BKOpenNavbar({
    super.key,
    this.selectedIndex = -1,
    required this.onTapHome,
    required this.onTapConfig,
    required this.onTapProfile,
    required this.onTapHelp,
    required this.onTapMenu,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Hero(
      tag: 'navbar',
      child: Material(
        type: MaterialType.transparency,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                /*
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    color: BKOpenColors.lightGrey,
                    border: Border(
                      top: BorderSide(color: BKOpenColors.disabled, width: 0.5),
                    ),
                  ),
                ),

                 */

                Container(
                  color: BKOpenColors.backgroudNav,
                  height: MediaQuery.of(context).size.height * 0.135,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: BKOpenNavbarButton(
                            label: "Início",
                            svgAssetName: 'assets/images/svg/home.svg',
                            selected: selectedIndex == 0,
                            onTap: () {
                              if (selectedIndex == 0) {
                                 onTapHome();
                              }
                              onTapHome();
                            },
                          ),
                        ),
                        Expanded(
                          child: BKOpenNavbarButton(
                            label: "Perfil",
                            svgAssetName: 'assets/images/svg/account_circle.svg',
                            selected: selectedIndex == 1,
                            onTap: () {
                              if (selectedIndex == 1) {
                                return;
                              }
                              onTapProfile();
                            },
                          ),
                        ),
                        Expanded(
                          child: BKOpenNavbarButton(
                            label: "Config.",
                            svgAssetName: 'assets/images/svg/settings.svg',
                            selected: selectedIndex == 2,
                            paintIcon: false,
                            onTap: () {
                              if (selectedIndex == 2) {
                                return;
                              }
                              onTapConfig();
                              // _scan(context);
                            },
                          ),
                        ),
                        Expanded(
                          child: BKOpenNavbarButton(
                            label: "Ajuda",
                            svgAssetName: 'assets/images/svg/help.svg',
                            selected: selectedIndex == 3,
                            onTap: () {
                              if (selectedIndex == 3) {
                                return;
                              }
                              onTapHelp();
                            },
                          ),
                        ),
                    
                        Expanded(
                          child: BKOpenNavbarButton(
                            label: "Menu",
                            svgAssetName: 'assets/images/svg/menu.svg',
                            selected: selectedIndex == 4,
                            onTap: () {
                              if (selectedIndex == 4) {
                                return;
                              }
                              onTapMenu();
                            },
                          ),
                        ),
                    
                    
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: BKOpenColors.backgroudNav,
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }
}


