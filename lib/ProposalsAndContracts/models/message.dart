import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Message {
  final String sender;
  final String text;

  Message({
    required this.sender,
    required this.text,
  });

  @override
  String toString() => 'Message(sender: $sender, text: $text)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sender': sender,
      'text': text,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: map['sender'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) => Message.fromMap(json.decode(source) as Map<String, dynamic>);
}
