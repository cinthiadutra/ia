enum Emprestimos { autoEquity, consignado, garantiaFGTS, pessoal, homeEquity;


  String get label {
    switch (this) {
      case Emprestimos.autoEquity:
        return 'Auto Equity';
      case Emprestimos.consignado:
        return 'Consignado';
      case Emprestimos.garantiaFGTS:
        return 'Saque antecipado FGTS';
      case Emprestimos.pessoal:
        return 'Pessoal';
      case Emprestimos.homeEquity:
        return 'Home Equity';
      default:
        return '';
    }
  }
  double get juros {
    switch (this) {
      case Emprestimos.autoEquity:
        return 8.0;
      case Emprestimos.consignado:
        return 7.66;
      case Emprestimos.garantiaFGTS:
        return 8.33;
      case Emprestimos.pessoal:
        return 10.77;
      case Emprestimos.homeEquity:
        return 8.5;
      default:
        return 8;
    }
  }
}