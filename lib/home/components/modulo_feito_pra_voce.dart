import 'package:bkopen/home/components/menu_card.dart';
import 'package:flutter/material.dart';

class ModuloFeitoPraVoce extends StatelessWidget {
  const ModuloFeitoPraVoce({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        childAspectRatio: 1.7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: List.generate(
          8,
          (index) => SizedBox(
            height: 60,
            child: MenuCard(index: index),
          ),
        ),
      ),
    );
  }
}
