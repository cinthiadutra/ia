import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first




class CountryModel {
    final String pais;
    final String? img;
    final int ddi;
    final String? continente;
  CountryModel({
   required this.pais,
    this.img,
  required  this.ddi,
    this.continente,
  });
    

  @override
  String toString() {
    return 'CountryModel(pais: $pais, img: $img, ddi: $ddi, continente: $continente)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pais': pais,
      'img': img,
      'ddi': ddi,
      'continente': continente,
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      pais: map['pais'] as String,
      img: map['img'] != null ? map['img'] as String : null,
      ddi: map['ddi'] as int,
      continente: map['continente'] != null ? map['continente'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) => CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
