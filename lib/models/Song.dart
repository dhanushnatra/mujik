class Songs {
  final List<Song> songs;
  Songs({required this.songs});
  factory Songs.fromJson(Map<String, dynamic> data) {
    return Songs(
        songs: (data["data"]["results"] as List)
            .map((x) => Song.fromJson(x))
            .toList());
  }
}

class Song {
  final String id;
  final String title;
  final String artist;
  final String imageUrl;
  final String url;
  final String duration;

  Song(
      {required this.duration,
      required this.id,
      required this.title,
      required this.artist,
      required this.imageUrl,
      required this.url});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json["id"],
      duration: json["duration"].toString(),
      title: json["name"],
      artist:
          (json['artists']["primary"] as List).map((x) => x["name"]).join(","),
      imageUrl: json['image'][1]['url'],
      url: json['downloadUrl'][3]['url'],
    );
  }
  Map toJson() {
    return {'title': title, 'artist': artist, 'image': imageUrl, 'url': url};
  }
}
