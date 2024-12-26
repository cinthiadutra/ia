import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

import '../../app/Strings/strings.dart';

class TextTerms extends StatelessWidget {
  final String title;

  const TextTerms({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$title. ${Strings.title_lorem}",
        style: Styles.labelText.copyWith(fontWeight: FontWeight.w400),
      ),
      subtitle: Text(
        Strings.body_lorem,
        style: Styles.labelText,
      ),
    );
  }
}
