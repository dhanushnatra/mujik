import 'package:flutter/material.dart';
import 'package:moozic/api/saavn.dart';
import 'package:moozic/models/Song.dart';

class Albums {
  final List<Album> albums;
  Albums({required this.albums});
  factory Albums.fromJson(Map<String, dynamic> json) {
    return Albums(
        albums: (json["data"]["results"])
            .map<Album>((e) => Album.fromJson(e))
            .toList());
  }
}

class Album {
  final String id;
  final String imageUrl;
  final String title;
  Album({required this.title, required this.id, required this.imageUrl});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json["name"],
      id: json["id"],
      imageUrl: json["image"][1]["url"],
    );
  }
}

class Albumbyid {
  final String id;
  final Songs songs;
  final String imageUrl;
  final String title;
  Albumbyid(
      {required this.title,
      required this.id,
      required this.songs,
      required this.imageUrl});
  factory Albumbyid.fromJson(Map<String, dynamic> json) {
    return Albumbyid(
      title: json["data"]["name"],
      id: json["data"]["id"],
      songs: Songs.fromJson(json["data"]["songs"]),
      imageUrl: json["data"]["image"][1]["url"],
    );
  }
}
