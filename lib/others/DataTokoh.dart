// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<DataTokoh> DataTokohFromJson(String str) => List<DataTokoh>.from(json.decode(str).map((x) => DataTokoh.fromJson(x)));

String DataTokohToJson(List<DataTokoh> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataTokoh {
    DataTokoh({
        this.id,
        this.name,
        this.type,
        this.category,
        this.tracks,
        this.description,
    });

    int id;
    String name;
    String type;
    String category;
    List<Track> tracks;
    String description;

    factory DataTokoh.fromJson(Map<String, dynamic> json) => DataTokoh(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        category: json["category"],
        tracks: List<Track>.from(json["tracks"].map((x) => Track.fromJson(x))),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "category": category,
        "tracks": List<dynamic>.from(tracks.map((x) => x.toJson())),
        "description": description,
    };
}

class Track {
    Track({
        this.id,
        this.name,
        this.path,
        this.duration,
    });

    int id;
    String name;
    String path;
    int duration;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "path": path,
        "duration": duration,
    };
}