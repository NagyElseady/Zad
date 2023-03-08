import 'dart:convert';

class ZadLectures {
  late int id;
  late int title;
  late int details;

  ZadLectures({required this.id, required this.title, required this.details});

  factory ZadLectures.fromRawJson(String str) =>
      ZadLectures.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ZadLectures.fromJson(Map<String, dynamic> json) => ZadLectures(
      id: json["_id"], title: json[" title"], details: json["details"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
      };
}
