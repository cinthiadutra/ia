// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final coResultDtoFields = coResultDtoFieldsFromMap(jsonString);

class OptionsList {
    final int? id;
    final String? name;

    OptionsList({
        this.id,
        this.name,
    });

    factory OptionsList.fromMap(Map<String, dynamic> json) => OptionsList(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };

  @override
  String toString() => 'OptionsList(id: $id, name: $name)';
}
