import 'dart:convert';



class ExCoNotificationDto {
  final String classname;
  final int? coMessageInstanceId;
  final String? subject;
  final String? message;
  final String? ocurrence;

  ExCoNotificationDto({
    this.classname = "ExCoNotificationDTO",
    this.coMessageInstanceId,
    this.subject,
    this.message,
    this.ocurrence,
  });

  @override
  String toString() {
    return 'ExCoNotificationDto(classname: $classname, coMessageInstanceId: $coMessageInstanceId, subject: $subject, message: $message, ocurrence: $ocurrence)';
  }

 

  Map<String, dynamic> toMap() {
    return {
      'classname': 'ExCoNotificationDTO',
      'coMessageInstanceId': coMessageInstanceId,
      'subject': subject,
      'message': message,
      'ocurrence': ocurrence,
    };
  }

  factory ExCoNotificationDto.fromMap(Map<String, dynamic> map) {
    return ExCoNotificationDto(
      classname: map['classname'],
      coMessageInstanceId: map['coMessageInstanceId']?.toInt(),
      subject: map['subject'],
      message: map['message'],
      ocurrence: map['ocurrence'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExCoNotificationDto.fromJson(String source) =>
      ExCoNotificationDto.fromMap(json.decode(source));
}
