import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CoQueryObjectDynamic {
    final String? classname;
    final String? queryName;
    final Items? items;

    CoQueryObjectDynamic({
        this.classname,
        this.queryName,
        this.items,
    });


  @override
  String toString() => 'CoQueryObjectDynamic(classname: $classname, queryName: $queryName, items: $items)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'classname': classname,
      'queryName': queryName,
      'items': items?.toMap(),
    };
  }

  factory CoQueryObjectDynamic.fromMap(Map<String, dynamic> map) {
    return CoQueryObjectDynamic(
      classname: map['classname'] != null ? map['classname'] as String : null,
      queryName: map['queryName'] != null ? map['queryName'] as String : null,
      items: map['items'] != null ? Items.fromMap(map['items'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoQueryObjectDynamic.fromJson(String source) => CoQueryObjectDynamic.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Items {
    final bool? onlyLinkCoClient;
    final bool? telegram;

    Items({
        this.onlyLinkCoClient,
        this.telegram,
    });


  @override
  String toString() => 'Items(onlyLinkCoClient: $onlyLinkCoClient, telegram: $telegram)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'onlyLinkCoClient': onlyLinkCoClient,
      'telegram': telegram,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      onlyLinkCoClient: map['onlyLinkCoClient'] != null ? map['onlyLinkCoClient'] as bool : null,
      telegram: map['telegram'] != null ? map['telegram'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source) as Map<String, dynamic>);
}
