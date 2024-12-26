

import 'package:flutter/material.dart';

import '../../app/theme/styles.dart';

class Screen extends StatelessWidget {
  final String image;
  final String title;


  const Screen({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
            title,
            style: Styles.h2Strong
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Image.asset(image),
        )
      ],
    );
  }
}
