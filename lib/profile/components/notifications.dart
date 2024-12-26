import 'package:flutter/material.dart';

import '../../app/theme/bkopencolors.dart';

class Notifications extends StatelessWidget {
  final int notificationCount;

  const Notifications({
    super.key,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 44, // Ajuste conforme necessário
          height: 44, // Ajuste conforme necessário
          decoration: BoxDecoration(
            color: BKOpenColors.deGrey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.notifications_none,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          top: -3, // Ajuste conforme necessário
          right: 2, // Ajuste conforme necessário
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Text(
              '$notificationCount',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
