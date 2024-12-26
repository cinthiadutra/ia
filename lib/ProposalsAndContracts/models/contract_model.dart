import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ContractModel {
  final String dataContrato;
  final String numeroContrato;
  final String emprestimos;
  ContractModel({
    required this.dataContrato,
    required this.numeroContrato,
    required this.emprestimos,
  });

  @override
  String toString() =>
      'ContractModel(dataContrato: $dataContrato, numeroContrato: $numeroContrato, emprestimos: $emprestimos)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dataContrato': dataContrato,
      'numeroContrato': numeroContrato,
      'emprestimos': emprestimos,
    };
  }

  factory ContractModel.fromMap(Map<String, dynamic> map) {
    return ContractModel(
      dataContrato: map['dataContrato'] as String,
      numeroContrato: map['numeroContrato'] as String,
      emprestimos: map['emprestimos'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContractModel.fromJson(String source) =>
      ContractModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
