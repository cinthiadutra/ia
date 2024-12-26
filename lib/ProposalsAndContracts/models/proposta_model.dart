import 'dart:convert';



// ignore_for_file: public_member_api_docs, sort_constructors_first
class PropostaModel {
  final String valorTotal;
  final String dataPropostas;
  final  String statusEnum;
  final String emprestimos;
  PropostaModel({
    required this.valorTotal,
    required this.dataPropostas,
    required this.statusEnum,
    required this.emprestimos 
  });




  @override
  String toString() {
    return 'PropostaModel(valorTotal: $valorTotal, dataPropostas: $dataPropostas, statusEnum: $statusEnum, emprestimos: $emprestimos)';
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'valorTotal': valorTotal,
      'dataPropostas': dataPropostas,
      'statusEnum': statusEnum,
      'emprestimos': emprestimos,
    };
  }

  factory PropostaModel.fromMap(Map<String, dynamic> map) {
    return PropostaModel(
      valorTotal: map['valorTotal'] as String,
      dataPropostas: map['dataPropostas'] as String,
      statusEnum: map['statusEnum'] as String,
      emprestimos: map['emprestimos'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PropostaModel.fromJson(String source) => PropostaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
