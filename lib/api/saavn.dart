import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:moozic/models/Album.dart';
import 'package:moozic/models/Song.dart';

String base_url = "https://saavn.dev/api";
Dio client = Dio();
Future<Songs> fetchSongs(String text) async {
  final response = await client
      .get('$base_url/search/songs?query=${text.split(' ').join('+')}');
  if (response.statusCode == 200) {
    return Songs.fromJson(jsonDecode(response.toString()));
  } else {
    throw Exception('Failed to load songs');
  }
}

Future<Song> songbyid(String id) async {
  final response = await client.get('$base_url/songs/$id');
  if (response.statusCode == 200) {
    return Song.fromJson(response.toString() as Map<String, dynamic>);
  } else {
    throw Exception('failed to load');
  }
}

Future<Album> albumbyid(String id) async {
  final response =
      await client.get('$base_url/albums/', queryParameters: {"id": id});
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.toString()));
  } else {
    throw Exception('Failed to load album');
  }
}

Future<Albums> fetchAlbums(String text) async {
  final response = await client
      .get('$base_url/search/albums?query=${text.split(' ').join('+')}');
  if (response.statusCode == 200) {
    return Albums.fromJson(jsonDecode(response.toString()));
  } else {
    throw Exception('Failed to load albums');
  }
}
