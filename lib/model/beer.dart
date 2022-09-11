import 'dart:convert';


class Beer {
  Beer({required this.id, required this.name, required this.tagline});
  String id;
  String name;
  String tagline;

  factory Beer.fromJson(Map<String, dynamic> json) => Beer(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      tagline: json['tagline'] ?? '');

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'tagline': tagline};
}
