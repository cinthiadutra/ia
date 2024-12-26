import 'package:flutter/material.dart';

import '../../theme/styles.dart';

class TextTerms extends StatelessWidget {
  final String body;

  const TextTerms({super.key, 
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(
        body,
        style: Styles.bodyText,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
