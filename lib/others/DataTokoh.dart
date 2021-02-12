// To parse this JSON data, do
//
//     final DataTokoh = DataTokohFromJson(jsonString);


// Tutorial Youtube : https://www.youtube.com/watch?v=wc8ecFSu5N8 - Easily Parsed JSON


import 'dart:convert';

List<DataTokoh> DataTokohFromJson(String str) => List<DataTokoh>.from(json.decode(str).map((x) => DataTokoh.fromJson(x)));

String DataTokohToJson(List<DataTokoh> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataTokoh {
    DataTokoh({
        this.id,
        this.name,
        this.type,
        this.category,
        this.description,
    });

    int id;
    String name;
    String type;
    String category;
    String description;

    factory DataTokoh.fromJson(Map<String, dynamic> json) => DataTokoh(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        category: json["category"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "category": category,
        "description": description,
    };
}
