import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class RequestJornadaDto {
  final String classname;
  final int? clienteId;
  final int? classeProdutoId;
  final int? agenteNegocioId;
  RequestJornadaDto({
     this.classname="JornadaDto",
    this.clienteId,
    this.classeProdutoId,
    this.agenteNegocioId,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'clienteId': clienteId,
      'classeProdutoId': classeProdutoId,
      'agenteNegocioId': agenteNegocioId,
    };
  }

  factory RequestJornadaDto.fromMap(Map<String, dynamic> map) {
    return RequestJornadaDto(
      classname: map['classname'] as String,
      clienteId: map['clienteId'] != null ? map['clienteId'] as int : null,
      classeProdutoId: map['classeProdutoId'] != null ? map['classeProdutoId'] as int : null,
      agenteNegocioId: map['agenteNegocioId'] != null ? map['agenteNegocioId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestJornadaDto.fromJson(String source) => RequestJornadaDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RequestJornadaDto(classname: $classname, clienteId: $clienteId, classeProdutoId: $classeProdutoId, agenteNegocioId: $agenteNegocioId)';
  }
}
