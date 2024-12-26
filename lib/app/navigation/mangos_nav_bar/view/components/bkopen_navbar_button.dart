// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/bkopencolors.dart';
import '../../../../theme/styles.dart';

class BKOpenNavbarButton extends StatefulWidget {
  final String? label;
  final String? svgAssetName;
  final bool selected;
  final bool paintIcon;
  final GestureTapCallback? onTap;

  const BKOpenNavbarButton({
    super.key,
    this.label,
    this.onTap,
    this.selected = false,
    this.svgAssetName,
    this.paintIcon = true,
  });

  @override
  _BKOpenNavbarButtonState createState() => _BKOpenNavbarButtonState();
}

class _BKOpenNavbarButtonState extends State<BKOpenNavbarButton> {
  late bool isActive;

  @override
  void initState() {
    isActive = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        if (!isActive) {
          setState(() {
            isActive = true;
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                setState(() {
                  isActive = false;
                });
              }
            });
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width:
                  41, // Definindo a largura do contêiner igual à altura para torná-lo redondo
              height:
                  41, // Definindo a altura do contêiner igual à altura para torná-lo redondo
              decoration: BoxDecoration(
                  shape: BoxShape
                      .circle, // Definindo a forma do contêiner como um círculo
                  color: isActive ? BKOpenColors.primary : Colors.white,
                  border: Border.all(
                      color: BKOpenColors.secondary,
                      width: 2) // Cor do fundo cinza
                  ),
              child: Center(
                child: SvgPicture.asset(
                  widget.svgAssetName!,
                  color: isActive
                      ? Colors.white
                      : BKOpenColors
                          .secondary, // Define a cor do ícone SVG como branca quando ativo, senão usa a cor do rótulo
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              widget.label!,
              style: isActive
                  ? Styles.navbarLabel.apply(color: BKOpenColors.blackSub)
                  : Styles.navbarLabel,
            ),
          ],
        ),
      ),
    );
  }
}
