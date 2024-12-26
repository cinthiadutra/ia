import 'dart:convert';

class ComessageList {
    final String? classname;
    final int? akdType;
    final String? astMessage;
    final dynamic astSource;
    final dynamic astModule;
    final String? astMessageDescription;
    final dynamic astOriginalMessage;
    final dynamic astOccurrence;
    final String? viewakdType;

    ComessageList({
        this.classname,
        this.akdType,
        this.astMessage,
        this.astSource,
        this.astModule,
        this.astMessageDescription,
        this.astOriginalMessage,
        this.astOccurrence,
        this.viewakdType,
    });

  @override
  String toString() {
    return 'ComessageList(classname: $classname, akdType: $akdType, astMessage: $astMessage, astSource: $astSource, astModule: $astModule, astMessageDescription: $astMessageDescription, astOriginalMessage: $astOriginalMessage, astOccurrence: $astOccurrence, viewakdType: $viewakdType)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'akdType': akdType,
      'astMessage': astMessage,
      'astSource': astSource,
      'astModule': astModule,
      'astMessageDescription': astMessageDescription,
      'astOriginalMessage': astOriginalMessage,
      'astOccurrence': astOccurrence,
      'viewakdType': viewakdType,
    };
  }

  factory ComessageList.fromMap(Map<String, dynamic> map) {
    return ComessageList(
      classname: map['classname'] != null ? map['classname'] as String : null,
      akdType: map['akdType'] != null ? map['akdType'] as int : null,
      astMessage: map['astMessage'] != null ? map['astMessage'] as String : null,
      astSource: map['astSource'] as dynamic,
      astModule: map['astModule'] as dynamic,
      astMessageDescription: map['astMessageDescription'] != null ? map['astMessageDescription'] as String : null,
      astOriginalMessage: map['astOriginalMessage'] as dynamic,
      astOccurrence: map['astOccurrence'] as dynamic,
      viewakdType: map['viewakdType'] != null ? map['viewakdType'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ComessageList.fromJson(String source) => ComessageList.fromMap(json.decode(source) as Map<String, dynamic>);

  ComessageList copyWith({
    String? classname,
    int? akdType,
    String? astMessage,
    dynamic astSource,
    dynamic astModule,
    String? astMessageDescription,
    dynamic astOriginalMessage,
    dynamic astOccurrence,
    String? viewakdType,
  }) {
    return ComessageList(
      classname: classname ?? this.classname,
      akdType: akdType ?? this.akdType,
      astMessage: astMessage ?? this.astMessage,
      astSource: astSource ?? this.astSource,
      astModule: astModule ?? this.astModule,
      astMessageDescription: astMessageDescription ?? this.astMessageDescription,
      astOriginalMessage: astOriginalMessage ?? this.astOriginalMessage,
      astOccurrence: astOccurrence ?? this.astOccurrence,
      viewakdType: viewakdType ?? this.viewakdType,
    );
  }
}
