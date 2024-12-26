import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardIndex extends StatelessWidget {
  final int i;
  const CardIndex({required this.i, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: Get.height * 0.025,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                  child: Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                        color: index == i
                            ? BKOpenColors.highlight
                            : Colors.grey[400],
                        //  shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(10.0)),
                    alignment: Alignment.center,
                  ),
                );
              })),
    );
  }
}
