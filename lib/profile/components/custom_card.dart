// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final urlImage;
  final Color backgroundColor;
  final VoidCallback onTap;
  final Color? color;
  final Color? colorImage;
  final Color? colorBorda;




  const CustomCard({
    super.key,
    required this.text,
    required this.urlImage,
    required this.backgroundColor,
    required this.onTap,  this.color, this.colorImage, this.colorBorda,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: colorBorda??Colors.transparent)
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color??Colors.black
                  ),
                ),
                SvgPicture.asset(
                  urlImage,
                  width: 18,
                  height: 18,
                  color: colorImage??Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
