import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class HistoryModel {
 final String emprestimo;
 final DateTime dataProposta;
  HistoryModel({
    required this.emprestimo,
    required this.dataProposta,
  });
 

  @override
  String toString() => 'HistoryModel(emprestimo: $emprestimo, dataProposta: $dataProposta)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'emprestimo': emprestimo,
      'dataProposta': dataProposta,
    };
  }

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      emprestimo: map['emprestimo'] as String,
      dataProposta: map['dataProposta'] as DateTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryModel.fromJson(String source) => HistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
