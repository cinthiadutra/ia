import 'package:flutter/material.dart';

import '../../app/theme/bkopencolors.dart';
import '../../app/theme/styles.dart';

class BuildProfileDetail extends StatelessWidget {
  final String title;
  final String? maskedData;
  final String? revealData;
  final bool showDetails;

  const BuildProfileDetail({
    super.key,
    required this.title,
    this.maskedData,
    this.revealData,
    required this.showDetails, // Adiciona showDetails como parâmetro
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styles.textForm.copyWith(
              color: BKOpenColors.secondary,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            showDetails ? (revealData ?? '') : (maskedData ?? ''),
            style: Styles.labelText.copyWith(
              color: BKOpenColors.blackSub,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
