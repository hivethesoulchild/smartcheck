// To parse this JSON data, do
//
//     final countDocuments = countDocumentsFromJson(jsonString);

import 'dart:convert';

CountDocuments countDocumentsFromJson(String str) => CountDocuments.fromJson(json.decode(str));

String countDocumentsToJson(CountDocuments data) => json.encode(data.toJson());

class CountDocuments {
  CountDocuments({
    required this.count,
  });

  int count;

  factory CountDocuments.fromJson(Map<String, dynamic> json) => CountDocuments(
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
  };
}
