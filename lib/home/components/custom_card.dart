// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final urlImage;
  final Color backgroundColor;
  final VoidCallback onTap;
  final double? widthBorder;

  const CustomCard({
    super.key,
    required this.text,
    required this.urlImage,
    required this.backgroundColor,
    required this.onTap, this.widthBorder,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: BKOpenColors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: BKOpenColors.secondary, width: widthBorder ?? 2)
          ),
          child: Container(
            height: 52,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Styles.buttonLabel
                  ),
                
                SvgPicture.asset(
                  urlImage,
                  width: 22,
                  height: 22,
                  color: BKOpenColors.highlight,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
