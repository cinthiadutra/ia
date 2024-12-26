import 'package:bkopen/init/controllers/init_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/theme/styles.dart';

class Screen extends StatelessWidget {
  final String image;
  final String title;
  final initController = Get.find<InitController>();

  Screen({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: Get.height / 10,
            left: 25,
            right: 15,
            child: Text(
              title,
              style: Styles.h2Strong.copyWith(color: Colors.white),
              maxLines: 3,
            )),
      ],
    );
  }
}
