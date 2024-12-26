import 'package:bkopen/app/components/button/bkopen_button.dart';
import 'package:bkopen/app/spacing/bkopen_spacing.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/loan/data/models/jornada_etapa_dto.dart';
import 'package:flutter/material.dart';

import '../../app/theme/styles.dart';

class PaymentDetailsWidget extends StatelessWidget {
  final JornadaEtapaDto model;
  final VoidCallback ontap;

  const PaymentDetailsWidget({
    super.key,
    required this.model,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return model.valoresSaida == null
        ? SizedBox.shrink()
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IDENTIFICADOR',
                      style: Styles.textDetails,
                    ),
                    Text(
                      model.id.toString(),
                      style: Styles.textDetailsBold.copyWith(
                        color: BKOpenColors.secondary,
                      ),
                    ),
                  ],
                ),
                BKOpenSpacing.x16,
                model.valoresSaida == null
                    ? SizedBox.shrink()
                    : Column(
                        children: model.valoresSaida!.map((atributo) {
                        return Column(
                          children: [
                            Visibility(
                              visible:
                                  model.valoresSaida == null ? false : true,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    atributo.viewatributoProdutoId ?? '',
                                    style: Styles.textDetails,
                                  ),
                                  Visibility(
                                    visible: atributo.viewvalor == null
                                        ? false
                                        : true,
                                    child: Flexible(
                                      child: atributo.viewtipoAtributo ==
                                              'Dinheiro'
                                          ? Text(
                                              atributo.viewvalor ?? '0,00',
                                              maxLines: 10,
                                              overflow: TextOverflow.ellipsis,
                                              style: Styles.textDetailsBold
                                                  .copyWith(
                                                color: BKOpenColors.secondary,
                                              ),
                                            )
                                          : atributo.viewtipoAtributo ==
                                                  'Boolean'
                                              ? Text(
                                                  atributo.viewvalor ?? '0,00',
                                                  maxLines: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Styles.textDetailsBold
                                                      .copyWith(
                                                    color:
                                                        BKOpenColors.secondary,
                                                  ),
                                                )
                                              : Text(
                                                  atributo.valor ?? '0,00',
                                                  maxLines: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: Styles.textDetailsBold
                                                      .copyWith(
                                                    color:
                                                        BKOpenColors.secondary,
                                                  ),
                                                ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BKOpenSpacing.x16
                          ],
                        );
                      }).toList()),
                Divider(
                  color: BKOpenColors.borderGreyLight,
                ),
                BKOpenSpacing.x8,
                BKOpenButton(
                  height: 40,
                  text: "Avaliar proposta",
                  onTap: () async {
                    
                    ontap();
                  },
                ),
                BKOpenSpacing.x8,
                Divider(
                  thickness: 1,
                  color: BKOpenColors.borderGreyLight,
                ),
              ],
            ),
          );
  }
}
