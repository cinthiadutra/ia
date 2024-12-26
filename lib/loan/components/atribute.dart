import 'dart:developer';

class Attribute {
  String? constant;
  dynamic value;
  String? sentence;
  bool visible;

  Attribute({this.constant, this.value, this.sentence, this.visible = false});
}

class AttributeProcessor {
  final List<Map<String, dynamic>> attributesList = [];

  // Função para salvar o par constant-value na lista
  void saveConstantValue(Attribute attribute) {
    if (attribute.constant != null) {
      attributesList.add({
        'constant': attribute.constant,
        'value': attribute.value,
      });
    }
  }

  // Função para processar a lógica do sentence e definir visibilidade
  void processSentenceVisibility(Attribute attribute) {
    if (attribute.sentence != null) {
      final bool result = evaluateSentence(attribute.sentence!);
      attribute.visible = result;
    }
  }

  // Função que interpreta e avalia a lógica do sentence
  bool evaluateSentence(String sentence) {
    for (var item in attributesList) {
      final constant = item['constant'];
      final value = item['value'];

      // Substituir o valor da constant na sentença com o valor real
      sentence = sentence.replaceAll('{$constant}', value.toString());
    }

    try {
      // Avaliar a expressão usando a condição desejada
      final isValid = evaluateLogicalExpression(sentence);
      return isValid;
    } catch (e) {
      log("Erro ao avaliar a expressão: $e");
      return false;
    }
  }

  // Função de exemplo para avaliar expressão lógica - implementação necessária
  bool evaluateLogicalExpression(String expression) {
    // Implemente um avaliador de expressão lógica customizado ou use uma biblioteca
    return expression == "CS_COMPOERENDA3O == 1";  // Exemplo estático para ilustração
  }
}
