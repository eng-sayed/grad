import 'dart:convert';

class MarkerModel {
  double? lat;
  double? lan;
  String? image;
  String? address;
  MarkerModel({
    this.lat,
    this.lan,
    this.image,
    this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lan': lan,
      'image': image,
      'address': address,
    };
  }

  factory MarkerModel.fromMap(Map<String, dynamic> map) {
    return MarkerModel(
      lat: map['lat']?.toDouble(),
      lan: map['lan']?.toDouble(),
      image: map['image'],
      address: map['address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MarkerModel.fromJson(String source) =>
      MarkerModel.fromMap(json.decode(source));

  MarkerModel copyWith({
    double? lat,
    double? lan,
    String? image,
    String? address,
  }) {
    return MarkerModel(
      lat: lat ?? this.lat,
      lan: lan ?? this.lan,
      image: image ?? this.image,
      address: address ?? this.address,
    );
  }
}
