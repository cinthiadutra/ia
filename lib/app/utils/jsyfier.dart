class Jsyfier {
  const Jsyfier._();

  /// The [parse] method is used to parse a value to a specific type. If the value is not the expected type, an
  /// ArgumentError is thrown.
  ///
  /// * [value] is the value to be parsed.
  /// * [name] is the name to be used on the ArgumentError throw.
  /// * [T] is the type to be parsed.
  static T parse<T>(dynamic value, {String? name}) {
    if (value is T) {
      return value;
    }

    throw ArgumentError.value(value, name, 'Expected $T but got ${value.runtimeType}');
  }

  static DateTime? parseDate(dynamic value, {String? name}) {
    final date = value as String?;

    if (date != null) {
      final dateTime = DateTime.tryParse(date);

      if (dateTime != null) return dateTime;

      throw ArgumentError.value(value, name, 'Date isnt parsable -> $value');
    }

    return null;
  }

  static List<Map<dynamic, dynamic>> parseMapList(dynamic list, {String? name}) {
    if (list is List) {
      return list.map((e) => parse<Map<dynamic, dynamic>>(e)).toList();
    }

    throw ArgumentError.value(list, name, 'Expected List but got ${list.runtimeType}');
  }
}
