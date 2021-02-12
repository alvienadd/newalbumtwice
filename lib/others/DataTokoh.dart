// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    Welcome({
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

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
        this.name,
        this.duration,
    });

    String name;
    int duration;

    factory Track.fromJson(Map<String, dynamic> json) => Track(
        name: json["name"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
    };
}
