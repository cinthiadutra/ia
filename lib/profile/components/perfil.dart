import 'dart:io';

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Perfil extends StatefulWidget {
  final Rx<String> name;
  final bool showPencilIcon;
  final bool isHome;

  const Perfil({
    super.key,
    required this.name,
    this.showPencilIcon = false,
    required this.isHome,
  });

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
          alignment: Alignment.center,
          children: [
            controller.isImageSavedPerfil.value
                ? CircleAvatar(
                    backgroundImage: FileImage(File(
                      controller.imagePath.value,
                    )),
                    radius: widget.isHome ? 20 : 60,
                  )
                : Container(
                    width:
                        widget.isHome ? 30 : 71, // ajuste conforme necessário
                    height:
                        widget.isHome ? 30 : 71, // ajuste conforme necessário
                    decoration: BoxDecoration(
                      color: BKOpenColors.primary, // Cinza mais claro
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(widget.name.value,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
            if (widget.showPencilIcon)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BKOpenColors.highlight, // Cor do lápis
                  ),
                  child: Icon(
                    Icons.edit_rounded, // Ícone do lápis
                    color: Colors.white, // Cor do ícone
                    size: 14,
                  ),
                ),
              ),
          ],
        ));
  }
}
