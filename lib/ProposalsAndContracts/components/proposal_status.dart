// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class ProposalStatus extends StatelessWidget {
final Color cor;
final String label;

 const ProposalStatus({
    super.key,
    required this.cor,
    required this.label,
  });
   
   @override
   Widget build(BuildContext context) {
       return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: cor,
      ),
      child: Center(
        child: Text(
          label,
          style: Styles.labelText
              .copyWith(fontWeight: FontWeight.w700, color: BKOpenColors.white),
        ),
      ),
    );
  }
}
