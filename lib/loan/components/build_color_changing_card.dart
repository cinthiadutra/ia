import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';

class BuildColorChangingCard extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final String title;
  final String imageSVG;
  final Color color;

  const BuildColorChangingCard({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.title,
    required this.imageSVG,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: isSelected ? BKOpenColors.primary : Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            border: Border.all(
              color: isSelected ? Colors.transparent : BKOpenColors.primary,
            ),
          ),
          height: 70,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : BKOpenColors.primary,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    imageSVG,
                    width: 24,
                    height: 24,
                    color: isSelected
                        ? BKOpenColors.white
                        : BKOpenColors.highlight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
