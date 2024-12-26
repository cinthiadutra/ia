
import 'package:bkopen/app/enums/enum_status_proposta.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PropostasModel {
  String emprestimo;
   double valueToReceive;
   DateTime firstInstallment;
   double installmentValue;
   double totalWithInterest;
   double interestRate;
   double interestYear;
  List <StatusPropostaEnum>? status;
  PropostasModel({
    required this.emprestimo,
    required this.valueToReceive,
    required this.firstInstallment,
    required this.installmentValue,
    required this.totalWithInterest,
    required this.interestRate,
    required this.interestYear,
    this.status,
  });

  @override
  String toString() {
    return 'PropostasModel(emprestimo: $emprestimo, valueToReceive: $valueToReceive, firstInstallment: $firstInstallment, installmentValue: $installmentValue, totalWithInterest: $totalWithInterest, interestRate: $interestRate, interestYear: $interestYear, status: $status)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emprestimo': emprestimo,
      'valueToReceive': valueToReceive,
      'firstInstallment': firstInstallment.millisecondsSinceEpoch,
      'installmentValue': installmentValue,
      'totalWithInterest': totalWithInterest,
      'interestRate': interestRate,
      'interestYear': interestYear,
      'status': status?.toList(),
    };
  }


}
