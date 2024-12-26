

import 'package:bkopen/app/utils/jsyfier.dart';

class AppHttpResponse {
  AppHttpResponse({
    this.data,
    this.errorMessage,
  });

  final dynamic data;
  final String? errorMessage;

  // ignore: sort_constructors_first
  factory AppHttpResponse.fromJson(Map<dynamic, dynamic> map) {
    return AppHttpResponse(
      data: map['response'] ?? map['data'],
      errorMessage: Jsyfier.parse<String?>(map['error'], name: 'errorMessage'),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'data': data,
      'errorMessage': errorMessage,
    };
  }
}
