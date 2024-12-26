import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/bkopencolors.dart';

class EtapaWidget extends StatelessWidget {
  final String page;
  final String label;
  const EtapaWidget({
    super.key,
    required this.page,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.11,
      width: Get.width * 0.9,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.02),
                child: Divider(
                  color: BKOpenColors.borderGreyLight,
                ),
              ),
              Center(
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: BKOpenColors.primary,
                  child: Text(
                    page,
                    style: Styles.h3Label,
                  ),
                ),
              ),
            ],
          ),
          BKOpenSpacing.x16,
          Center(
            child: Text(
              label,
              style:
                  Styles.labelStatusText.copyWith(color: BKOpenColors.blackSub),
            ),
          ),
        ],
      ),
    );
  }
}
