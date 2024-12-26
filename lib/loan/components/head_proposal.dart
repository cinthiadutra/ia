import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:bkopen/ProposalsAndContracts/components/filter_dialog.dart';
import 'package:flutter/material.dart';

class HeadProposal extends StatelessWidget {
   
   const HeadProposal({super.key});
   
   @override
   Widget build(BuildContext context) {
       return  Column(children: [
                  BKOpenSpacing.x24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ofertas para você",
                        style: Styles.h4,
                      ),
                      InkWell(
                        onTap: () {
                          // Mostrar o popup de filtrar
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return FilterDialog();
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              'Filtrar',
                              style: Styles.textUnderline
                                  .copyWith(color: BKOpenColors.secondary),
                            ),
                            Icon(
                              Icons.filter_alt_outlined,
                              size: 18,
                              color: BKOpenColors.secondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
       ]
       );
  }
}