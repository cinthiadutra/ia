import 'package:bkopen/app/theme/bkopencolors.dart';
import 'package:flutter/material.dart';

enum StatusPropostaEnum {
  desejo,
  interesse,
  simulacao,
  proposta,
  pendencia,
  restricao,
  negociacao,
  fechado,
  naofechado,
  cancelado;

  String get nome {
    switch (this) {
      case StatusPropostaEnum.desejo:
        return "Desejo";
      case StatusPropostaEnum.interesse:
        return "Interesse";

      case StatusPropostaEnum.simulacao:
        return "Simulacao";
      case StatusPropostaEnum.proposta:
        return "Proposta";
      case StatusPropostaEnum.pendencia:
        return "Pendencia";
      case StatusPropostaEnum.restricao:
        return "Restricao";
      case StatusPropostaEnum.negociacao:
        return "Negociacao";
      case StatusPropostaEnum.fechado:
        return "Fechado";
      case StatusPropostaEnum.naofechado:
        return "Não Fechado";
      case StatusPropostaEnum.cancelado:
        return "Cancelado";
    }
  }

  Color get cor {
    switch (this) {
      case StatusPropostaEnum.desejo:
        return BKOpenColors.statuAA461;
      case StatusPropostaEnum.interesse:
        return BKOpenColors.status401;

      case StatusPropostaEnum.simulacao:
        return BKOpenColors.status315;
      case StatusPropostaEnum.proposta:
        return BKOpenColors.statusGreen;
      case StatusPropostaEnum.pendencia:
        return BKOpenColors.status21;
      case StatusPropostaEnum.restricao:
        return BKOpenColors.statuAA4671;
      case StatusPropostaEnum.negociacao:
        return BKOpenColors.status21c;
      case StatusPropostaEnum.fechado:
        return BKOpenColors.status21b;
      case StatusPropostaEnum.naofechado:
        return BKOpenColors.status315;
      case StatusPropostaEnum.cancelado:
        return BKOpenColors.status443;
    }
  }
}
