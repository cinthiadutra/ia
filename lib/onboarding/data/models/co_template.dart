import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoTemplate {


  final String? topic;
  final String? subTopic;
  final String? detail;
  final String? culture;
  final String? text;
  CoTemplate({
    this.topic,
    this.subTopic,
    this.detail,
    this.culture,
    this.text,
  });

  

  @override
  String toString() {
    return 'CoTemplate(topic: $topic, subTopic: $subTopic, detail: $detail, culture: $culture, text: $text)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topic': topic,
      'subTopic': subTopic,
      'detail': detail,
      'culture': culture,
      'text': text,
    };
  }

  factory CoTemplate.fromMap(Map<String, dynamic> map) {
    return CoTemplate(
      topic: map['topic'] != null ? map['topic'] as String : null,
      subTopic: map['subTopic'] != null ? map['subTopic'] as String : null,
      detail: map['detail'] != null ? map['detail'] as String : null,
      culture: map['culture'] != null ? map['culture'] as String : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoTemplate.fromJson(String source) => CoTemplate.fromMap(json.decode(source) as Map<String, dynamic>);
}
