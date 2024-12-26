import 'package:bkopen/app/enums/enum_status_proposta.dart';
import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:bkopen/app/theme/styles.dart';
import 'package:flutter/material.dart';

class CardStatus extends StatelessWidget {
  final String nome;
  final Color colors;
  final Color textColor;
  const CardStatus(
      {super.key,
      required this.nome,
      required this.colors,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        border: Border.all(color: BKOpenColors.secondary),
        borderRadius: BorderRadius.circular(30),
        color: colors,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nome,
            style: Styles.subTextDetails.copyWith(color: textColor),
          ),
          SizedBox(
            width: 2,
          ),
          Visibility(
              visible: StatusPropostaEnum.restricao.name == 'Em Analise' ||
                      StatusPropostaEnum.naofechado.name == 'Em formalização'
                  ? true
                  : false,
              child: Icon(
                Icons.info_outline_rounded,
                size: 14,
              ))
        ],
      ),
    );
  }
}
