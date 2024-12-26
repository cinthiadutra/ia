import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';

class BKOpenLoading extends StatelessWidget {
  const BKOpenLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 32,
        height: 32,
        child: CircularProgressIndicator(color: BKOpenColors.highlight,),
      ),
    );
  }
}
